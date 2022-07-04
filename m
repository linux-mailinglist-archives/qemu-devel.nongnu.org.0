Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95609565647
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 14:59:58 +0200 (CEST)
Received: from localhost ([::1]:58842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8LgD-00030k-MD
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 08:59:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8LdT-0000X3-Fn
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:57:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8LdR-0007Ee-UK
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:57:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656939425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MBOFr1na+MPajGH1DhlfsduYGh8j/s9sAXrMSuN/A2w=;
 b=Npp31BkzrreeVApQAdDJ/A2ivnzQKFv6Ix32Ujg5QkaWkxnwPKS3XYuLbA+E22GneQasUc
 tLWVqHy5oPZH6rkT8V17QF2i5HnY+6QDzalVrqpY7lqJHAeSWA0vgVgQfHpv0Y6N64pB9E
 lVFG+UW82XBqRuZuNEFrThla8pmGV8I=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-SXV-mPsyOaypbcDJvPKPeA-1; Mon, 04 Jul 2022 08:57:04 -0400
X-MC-Unique: SXV-mPsyOaypbcDJvPKPeA-1
Received: by mail-il1-f199.google.com with SMTP id
 h5-20020a056e021b8500b002d8f50441a2so4182702ili.13
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 05:57:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MBOFr1na+MPajGH1DhlfsduYGh8j/s9sAXrMSuN/A2w=;
 b=omS6pP3K/Np0VvBNq7/speoFQO90ZFBtXtteheFkVvZC31Ibg5ypJW/3ziUL/F/ZBL
 nxqB7p6UtDG+fDb5RhWWsyTQbsRWLNNf/3j/I3nRoGnx5mLmtng14lGGYiwWuB7LfAOD
 GvMvvPyGtvjJTuJWNbYRwtl5gquxUN0T4tZHuZcFgp7ohKVJ18x4PAQ2+ZhqavvLyciN
 rIr64ddujOIP5U8iF7qbFe7thMI/FW6A8m8iV+1IxnacV19UGZPEOIIWFsPKt+Ll/CuP
 HiI5BEFryLkjYvXe0jtc9NOsMialCOtSNAs91c1bZtQ6y99mDJJUiDDtbXhToPRxftCA
 Pnsw==
X-Gm-Message-State: AJIora88hYsjtF1auQlM7ZxCpc+Tx3GqHoaW3mBy0EkwAn7NYjfyOvzk
 8wwH0tXW23PUYZyQPDd/kmoAuwvAv2bnzBrBqXBsMaS/Qejr+kqtKLyOcksyDZs/e9fUg3a0as4
 fZtWW1jODu6VXZfQLt1P2QIRW56lAu8I=
X-Received: by 2002:a6b:f718:0:b0:675:54cb:dda with SMTP id
 k24-20020a6bf718000000b0067554cb0ddamr16419118iog.114.1656939423451; 
 Mon, 04 Jul 2022 05:57:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1svRHnMC2M+UOgjadudu7e7iXM9YnDMSqvFhD+mMGHgH0l9F3vJUZqW32LliGIuNapX+7x6dmd036NfD+ZB8m4=
X-Received: by 2002:a6b:f718:0:b0:675:54cb:dda with SMTP id
 k24-20020a6bf718000000b0067554cb0ddamr16419113iog.114.1656939423306; Mon, 04
 Jul 2022 05:57:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220509103019.215041-1-pbonzini@redhat.com>
 <20220509103019.215041-3-pbonzini@redhat.com>
In-Reply-To: <20220509103019.215041-3-pbonzini@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Mon, 4 Jul 2022 13:56:27 +0100
Message-ID: <CAELaAXxNH0k+EL_tnwnUGODALr8XhBb4Uy46C7mjd=N3DMCCZw@mail.gmail.com>
Subject: Re: [PATCH v2 02/26] qcow2: remove incorrect coroutine_fn annotations
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 9, 2022 at 11:35 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
> This is incorrect because qcow2_mark_clean() calls qcow2_flush_caches().
> qcow2_mark_clean() is called from non-coroutine context in
> qcow2_inactivate() and qcow2_close().
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/qcow2-refcount.c | 4 ++--
>  block/qcow2.h          | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Alberto Faria <afaria@redhat.com>


