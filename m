Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B00776BFC1D
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Mar 2023 19:12:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdb15-0003o1-Jh; Sat, 18 Mar 2023 14:10:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pdb0u-0003nU-4t
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 14:10:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pdb0s-0003tP-Po
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 14:10:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679163041;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type; bh=+GjR7fSCNL8SDsgzOekp2fTkL2g0P5AjbEUKio71uEs=;
 b=Zv+Qmbo6ZedDheLJyhMYWhRnWuEFjujBkFmjwevZF0O3PIuGJG273rGKkU28rz5wjxKMFH
 2I6TguR3sBieJWJDYuIIuDmruW8/LGJ5f283OU7lezw60YPEQEpPLUzlLQm/7jhhAj8wHh
 0hJpOornSOPtbMMA6ICOXW0GUrtQnXY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-347-85APwq0CP8SbLlwDP6L8ew-1; Sat, 18 Mar 2023 14:10:40 -0400
X-MC-Unique: 85APwq0CP8SbLlwDP6L8ew-1
Received: by mail-wm1-f70.google.com with SMTP id
 k41-20020a05600c1ca900b003ed383b1b62so3061500wms.8
 for <qemu-devel@nongnu.org>; Sat, 18 Mar 2023 11:10:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679163038;
 h=mime-version:message-id:date:reply-to:user-agent:subject:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+GjR7fSCNL8SDsgzOekp2fTkL2g0P5AjbEUKio71uEs=;
 b=Xpj3RkBHBaEFL1bWDQrCG8Epfi0uX7JNuVhhOO3O2FHYJXVIoQ8av5TTfkqonIQIFG
 6RD/euKdW7Q3SMONbeb/A8gjRCMLuskxN2kT9tdHyIoFAd6te3YCQZzCD7FGm6npytLS
 PYltk0aDe5Gtb2uK/mOGsjgx1p8Cuatcgin+BQ3EsePZXGRdiIANu6GoCMmhGrNBSstD
 4RDuae//HWoBPcAoUJhzR7Qn290VCzBJQApxqCOB11D5/OzIHKvxr1X4HD551fpGwFfU
 fS1C24JmUv/zRyw7Xe7XtFOw6zaeBw3dq8GTzerrlnJKU7G3vv1OR5TDOmUDNvTL1C6m
 wB1A==
X-Gm-Message-State: AO0yUKXAIMqXvkYuFZvS7nhgfA8uwLaK+f/nHIKorJZuYuY9al+qrp//
 veF0ozBbNfCxWvZPEn8qwo0x9j/B5rSpQRy6fQ8Nl37Dpx8MHRF/vV+Ej/3B68/rJczFgie8zoz
 gCXohlYAFwe7l0ZOSm5ylv7GZ2fatP/75USqUXqKc5VAVnGYFyvm7KirFxoqyq9s1hgZLfxELut
 LDYoYL
X-Received: by 2002:a05:600c:46c7:b0:3d3:49db:9b25 with SMTP id
 q7-20020a05600c46c700b003d349db9b25mr27429706wmo.26.1679163038678; 
 Sat, 18 Mar 2023 11:10:38 -0700 (PDT)
X-Google-Smtp-Source: AK7set8xkg8OfKGxHO9gdyd5K3dDqlSysUY5qzN0XBMec8uJZ5R3AcuDriQrl+mm0GU7oHsEYYF/mw==
X-Received: by 2002:a05:600c:46c7:b0:3d3:49db:9b25 with SMTP id
 q7-20020a05600c46c700b003d349db9b25mr27429691wmo.26.1679163038394; 
 Sat, 18 Mar 2023 11:10:38 -0700 (PDT)
Received: from redhat.com (62.117.238.225.dyn.user.ono.com. [62.117.238.225])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a7bc403000000b003ed1f69c967sm11311267wmi.9.2023.03.18.11.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 11:10:37 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org, kvm-devel <kvm@vger.kernel.org>
Subject: Should I record QEMU developers fortnightly call?
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Sat, 18 Mar 2023 19:10:37 +0100
Message-ID: <87sfe2j5gi.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Hi

I got asked several times if we have a record of previous QEMU calls.
I think that we don't discuss anything that prevent us for recording the
calls. But they have never been recorded in the past.  Could we discuss
if should record them and make the recordings available, or not?

Is there anyone that has any strong opinion in any of the two
directions?

Thanks, Juan.


