Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B055520F5
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 17:30:46 +0200 (CEST)
Received: from localhost ([::1]:39842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3JMT-00082k-Fp
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 11:30:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3JJj-0003ud-2B
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:27:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3JJh-0002W6-3U
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:27:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655738871;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FEwShsO/jdq9mNgmSoCaVsVVT0+IsEuT3hfR5MzzrP4=;
 b=hyhzjtEqkXlzXj+/b4LjmCchW797x8L/6N3di9ddQWsUMBcg+kXmYMBEQhya6GQJ6OgWOi
 EkmMPE9TO+pq5UQI1OE+UUHC9CHBrJPQY35T6BDAAFV521tp7OmcgHocHxrU4Lem3rDUDU
 VMt0qzfMpWKPVQ80QPg1ECrwq/Zohck=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-168-jUoPfwOSMV2EQXZw_czw_g-1; Mon, 20 Jun 2022 11:27:50 -0400
X-MC-Unique: jUoPfwOSMV2EQXZw_czw_g-1
Received: by mail-wm1-f70.google.com with SMTP id
 c185-20020a1c35c2000000b0039db3e56c39so7025924wma.5
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 08:27:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FEwShsO/jdq9mNgmSoCaVsVVT0+IsEuT3hfR5MzzrP4=;
 b=rW3mLeoyvlOYLoDWgL/sN0zApsclZbWAT13jYgC++vXqh1ddhm3lbXd3F3It1lpkm2
 QcE6NFgG2vaXJRmshb31QIvtjZS1snD9OiRG64GqJpBocXsJ7htIPyBDJQLrVVfEAEee
 obFCf+40EYy6JRQsiwKkWuYV0geiTwihODvN+3rMC23KxR5eN5GXiv5GN0Gu9RahOCWL
 00/3gjmhRlill88vAgGz7iVUBY5IOLsS1+iqmOEGmnOY4XNu1xU2ibPaoCdr+2X+8AAx
 4rcFWE7wN2rbwUhFw1Mh+YGlabmFINy4Lsf8nj3V+1r3uJ1Was1p9V3GgnfL2e+YTN27
 ZZpw==
X-Gm-Message-State: AOAM530IJGk5bH7x7iwFjcspqdPqaL+N+WsvNDmvjMFe7KGH5+W/l4pG
 QpWuAOc1p54n+KSWDrIBCFAGyRTHmo7SNVxaIeQZC25qO4WKrIppHx/vsR5rW3MPjIGvsFRornN
 6dorRYI3FeXMiHtI=
X-Received: by 2002:a05:600c:1d1f:b0:39c:5350:c5a3 with SMTP id
 l31-20020a05600c1d1f00b0039c5350c5a3mr34629047wms.136.1655738869218; 
 Mon, 20 Jun 2022 08:27:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQ8quJDtw6qwEGIgAsqcKMYfxHuJsIsyYhkdibIAzXHwgVz4PCOybhdR5o0PFWxGrdLER2rQ==
X-Received: by 2002:a05:600c:1d1f:b0:39c:5350:c5a3 with SMTP id
 l31-20020a05600c1d1f00b0039c5350c5a3mr34629019wms.136.1655738868994; 
 Mon, 20 Jun 2022 08:27:48 -0700 (PDT)
Received: from localhost ([212.145.226.77]) by smtp.gmail.com with ESMTPSA id
 k7-20020a7bc407000000b0039c747a1e8fsm20926226wmi.7.2022.06.20.08.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 08:27:48 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Stefan Hajnoczi <stefanha@redhat.com>,  Hailiang
 Zhang <zhang.zhanghailiang@huawei.com>,  Fam Zheng <fam@euphon.net>,
 Hailiang Zhang <zhanghailiang@xfusion.com>
Subject: Re: [PATCH v2 13/21] migration: introduce new constructors for
 QEMUFile
In-Reply-To: <20220620110205.1357829-14-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Mon, 20 Jun 2022 12:01:57
 +0100")
References: <20220620110205.1357829-1-berrange@redhat.com>
 <20220620110205.1357829-14-berrange@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 20 Jun 2022 17:27:47 +0200
Message-ID: <87v8sv1hjg.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> Prepare for the elimination of QEMUFileOps by introducing a pair of new
> constructors. This lets us distinguish between an input and output file
> object explicitly rather than via the existance of specific callbacks.
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

I would argue that creating the is_writable parameter it is easier to
just set f->is_writable directly  in qemu_file_new_output(), but again,
you are the one doing the code.

Later, Juan.


