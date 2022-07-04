Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11701565708
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 15:24:15 +0200 (CEST)
Received: from localhost ([::1]:44352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8M3i-0007W8-3Y
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 09:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8Lg5-0004zo-BO
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:59:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8Lg3-0007Z3-RU
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:59:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656939587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aOyMHOUXAEplobdNBRO2JzV5+npux04BsdB76U/nNmM=;
 b=ULQqjaAIxclwrGAu8QC+Mdj5sLEPPCziQh8OOE+Ks4mhdkz8lBVP+MP2ohSIqEXC1C3N0G
 OnsRElkN70V5b49YEjH39FTeciD3ZZy8f3sLF8wvuj4pnNYsYaF8czW4n9ukzwuRuGBG8+
 KWqVaM/akl4gByENBSDocNVHUY8bAQA=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-UWRneqFSN1GQ7Iw6q0Xu9w-1; Mon, 04 Jul 2022 08:59:46 -0400
X-MC-Unique: UWRneqFSN1GQ7Iw6q0Xu9w-1
Received: by mail-il1-f200.google.com with SMTP id
 w15-20020a056e021a6f00b002d8eef284f0so4146079ilv.6
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 05:59:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aOyMHOUXAEplobdNBRO2JzV5+npux04BsdB76U/nNmM=;
 b=mfpOl0XB5vLvWIlMv5Xk1J3hMQtxXxMr8yPPPOxuz0I8ycTN5Fo/okEBJ97q2bOgWZ
 UC2uzAnB9J1GjtIpSEpT6BsGpGYYV9CWPIzkT98N/Z7JEhQOirYMFN2poTTU7rNS/ITv
 fuEymRyJSg9dmtEBinFyQmZ6XyHBOOOENsrPsaqRqnkkeZdj4WTXd7s4McB7fmmCXOUd
 gtRrATrGjdN29GsheEmaIKK0eiJ+k0Y8ocGXqTagf/tg7dhVBW/m1SslQIyXg63vtlfS
 RPTz3ER0Vko/TlYiczuIi/4Ja88tgf5FRyybvKX8C+ITXnHHrSyN/WprMUei5aRMUZ+W
 0NnQ==
X-Gm-Message-State: AJIora9Vpw1x1Cc+XX6SBnTQZcJcBlBTIxlB2Sb/8N0ccXJ3ZRsnifnz
 WdXpvxRIHDEIcxkP/uwsSFLoZlouX+FFjgefN1n1qmRAytHiq+Q1qHxvHEcmbMQsESucG/HoAqz
 GcH1qwCKUUAoDTszPYWDum8nA20rIIXk=
X-Received: by 2002:a05:6e02:1486:b0:2da:9864:b480 with SMTP id
 n6-20020a056e02148600b002da9864b480mr17682519ilk.70.1656939585009; 
 Mon, 04 Jul 2022 05:59:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tSt8xLtXCd4CyQEK9Uw+MHx1vfD6t0XWHef4DwtuyG14RBD8eRqpgdtvri8oQReIQJRm7a4ZPM/Qk33oQlZVg=
X-Received: by 2002:a05:6e02:1486:b0:2da:9864:b480 with SMTP id
 n6-20020a056e02148600b002da9864b480mr17682512ilk.70.1656939584852; Mon, 04
 Jul 2022 05:59:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220509103019.215041-1-pbonzini@redhat.com>
 <20220509103019.215041-13-pbonzini@redhat.com>
In-Reply-To: <20220509103019.215041-13-pbonzini@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Mon, 4 Jul 2022 13:59:09 +0100
Message-ID: <CAELaAXxUr3DuYqpq4x3Ou5nwV8wqxNgBLwY7V=4eSkf-yFdoeQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/26] nvme: add missing coroutine_fn annotations
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

On Mon, May 9, 2022 at 12:02 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/nvme.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Alberto Faria <afaria@redhat.com>


