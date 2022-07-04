Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E156B5656C6
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 15:16:00 +0200 (CEST)
Received: from localhost ([::1]:60806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Lvj-0007I1-SN
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 09:15:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8Lfr-0004Qz-1H
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:59:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8Lfp-0007Xp-6l
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:59:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656939572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VBcORQd1OYB7za30UYhxfvlTYDEJswRw1RSEoKYpImo=;
 b=P+6l1aj+PdiWitIRQyMGuurpmHEwXhfPgsdeJulNntad/AdO0oNF2XY4T1nWxOnk3Xu1lc
 bx7wkEMantE4CLfSO98TEvWbN/qWtvcc0HXdlJzniRBGTiIylgnkPv3l9l4/9wL3eqjSPK
 9SwvMi0LBcDSwoX7JRjl3i6W2hatZY8=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-Ofoi4bUHPt-jSFtGmxuJ-w-1; Mon, 04 Jul 2022 08:59:29 -0400
X-MC-Unique: Ofoi4bUHPt-jSFtGmxuJ-w-1
Received: by mail-il1-f197.google.com with SMTP id
 i2-20020a056e021b0200b002dadf6a0a0eso4158667ilv.12
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 05:59:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VBcORQd1OYB7za30UYhxfvlTYDEJswRw1RSEoKYpImo=;
 b=n3YfD+2qvesKjntKq0uc0jEg41p/4vdBDkqShGdmL9kebnY14bWSNtDc0Klq7AClCV
 CG5P6GKRBb9h/BAiVcKhnojk5OlodUNAJxQp13j84R+EloYlicMB5s+tcaFvHSx0vmmc
 cXMDLwmoIMw0/09LFSuoZXIKYejiQJKAvipM7ZQQdHjFCjLRZLdnMCH0pZeqtRC6vajD
 VPXvLlCSFr7K9By1yLG38q1KhTFZxT1zUe12CiKNhHsxf7cVu2aYsDOiUj7F4rMSurtp
 Fb9Y1bR0PBSZVPFCWEqiNbvRPeri2fbLHbknnI7+9LE1RrtZUkLBnLxYvaR/cWqNTxc9
 sN0w==
X-Gm-Message-State: AJIora+Ysnu6uOAhDwz3rBIeHQzhM/xJtqUW41TsF2DWWbwgZ8Uef+tr
 Rf2Q563TU4wFCorsaAc1KOd5NWVN3tuUXmIsLm7OhmsyWESW4uKRBius2Adu5awzvqeYB78Lwqn
 NWDKdLb2jdyso9ysYQ6sInrj9GXF6rQ4=
X-Received: by 2002:a05:6638:1346:b0:33e:c430:9575 with SMTP id
 u6-20020a056638134600b0033ec4309575mr6000883jad.129.1656939569128; 
 Mon, 04 Jul 2022 05:59:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vQkhJARII9sX7HknNBCAtwPAYH3dILKcdlaEg2irYt/cRAUsjAryYmxv/1Ga2LhMDrk5XCJDf5vMKCsYvwJFk=
X-Received: by 2002:a05:6638:1346:b0:33e:c430:9575 with SMTP id
 u6-20020a056638134600b0033ec4309575mr6000875jad.129.1656939568993; Mon, 04
 Jul 2022 05:59:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220509103019.215041-1-pbonzini@redhat.com>
 <20220509103019.215041-11-pbonzini@redhat.com>
In-Reply-To: <20220509103019.215041-11-pbonzini@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Mon, 4 Jul 2022 13:58:53 +0100
Message-ID: <CAELaAXzai6L_H1B5LovCiAALn=qfFEGgJ1ySVjGE7JjAU0FPdw@mail.gmail.com>
Subject: Re: [PATCH v2 10/26] nbd: add missing coroutine_fn annotations
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, May 9, 2022 at 11:54 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/nbd.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Alberto Faria <afaria@redhat.com>


