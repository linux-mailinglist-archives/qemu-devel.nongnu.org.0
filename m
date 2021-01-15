Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4870C2F8207
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 18:21:03 +0100 (CET)
Received: from localhost ([::1]:55414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0SmU-0002aC-CK
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 12:21:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l0SlF-0001sg-6A
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 12:19:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l0Sl8-0000gt-CF
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 12:19:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610731176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pN6nn8Uc/nHqVyZpugjFrDSwlCA5ChimXwjnehQPdkI=;
 b=PEclhe1xpthxZO9l8I9ObC+gBb/jBcsh8sTUOZNkAMTZTJcIIJWBwORNcHN8L9hOMhEKSQ
 U2xRKnKh7wKwiqsqWVg7E+3y63c9Ch+puhBWch8YhkZ/HGlwvn+N6XRw6+4gh2nYtIccjN
 CLuDNtlpnXGq17wX2at3GjtgEOC+gWQ=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-QcQQPqDNPtyeh3MhqkvLoQ-1; Fri, 15 Jan 2021 12:19:35 -0500
X-MC-Unique: QcQQPqDNPtyeh3MhqkvLoQ-1
Received: by mail-vk1-f199.google.com with SMTP id m20so4374268vkk.16
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 09:19:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pN6nn8Uc/nHqVyZpugjFrDSwlCA5ChimXwjnehQPdkI=;
 b=PpTNroVxt35JAclODeReCBUs7bw8h+Xnff4iUT2wXoHaP7pJtOoNKfpClgszphSqUa
 ZYIC2Ok4FwFy5cZFmD0TymDAwlePFgNhA+dllW7vgDLYoX+NU4irkI7pN0S2RdIMJr4d
 WKMoeumQggxDlEQT2zSHiAqoL/+BUsx/xqGdpbaAOdxdsfxFbzCr4GLdBzR0ch/KCUz/
 +6lLRSOHV5Jjw+g1XvDxH4ev/bRvFctUK+AevBWd3QxSAEeQckBlAmQ440C9e2pPjqdL
 Y7p1NKou5WD1oBfsyPvQw2iQIL5ROVOn/0PpO8fq6hIWUWnlFLbH8yDCzsqf4W/EJXBd
 mTlg==
X-Gm-Message-State: AOAM530F3RvC2QHHA0MJ+6WRZ1Maj2qZ8mnyLK9U4m24EoFOlIimccAk
 M8Em+8YHYf9VR7dV+7GR0ANENCp7YNCZkGLERngo2D2KeY1Gwqvi1PZzURJMOsAiHVdl0M/0SER
 7YuSiL3vNvfktX3zWQe3LnRRBZGBAhwY=
X-Received: by 2002:a67:e155:: with SMTP id o21mr11137156vsl.39.1610731174719; 
 Fri, 15 Jan 2021 09:19:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBl2/yb+C0Yv9dtqcp+WwCTsAdT8CUPGocwFAbkqcgxeYovMdXCx2VxiyoEgHmPc8hlFIwJG57uv1Bpw/S9us=
X-Received: by 2002:a67:e155:: with SMTP id o21mr11137129vsl.39.1610731174518; 
 Fri, 15 Jan 2021 09:19:34 -0800 (PST)
MIME-Version: 1.0
References: <20210112164045.98565-1-thuth@redhat.com>
 <20210112164045.98565-3-thuth@redhat.com>
In-Reply-To: <20210112164045.98565-3-thuth@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 15 Jan 2021 14:19:08 -0300
Message-ID: <CAKJDGDYECxMBnThzXcPnTGJ3fDrvcsJ+w0cxMq_f-Vt=a-6puQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] tests/acceptance: Test the mpc8544ds machine
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-ppc@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 12, 2021 at 1:44 PM Thomas Huth <thuth@redhat.com> wrote:
>
> We can use the "Stupid creek" image to test the mpc8544ds ppc machine.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/acceptance/machine_ppc.py | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


