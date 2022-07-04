Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 378D5565714
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 15:24:47 +0200 (CEST)
Received: from localhost ([::1]:45334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8M4D-0008Ek-On
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 09:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8LhP-00061X-2S
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:01:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8LhN-00082X-GM
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:01:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656939668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a0VfoDzq8YoHMgYUM9GgDmVVbUPmxvxlahqSIHyPsBQ=;
 b=AH/GBdskeytjl9NTu/F4EiFA2yALmxtbJSwccMGuyCwMaRCQIfgUZh/D4vaZAKo5+6St70
 m5vuykKFiIPGKXOYIYBsGM7seKUJYZ+yiUppzeSbkATB1aOaDy+erbw3oducReYxtbQ2Rj
 hp7/rDnad6XLykOm/DE9SGYiNYo6kYY=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-138-JxTHoE_sMaG6OQohSab9JA-1; Mon, 04 Jul 2022 09:01:02 -0400
X-MC-Unique: JxTHoE_sMaG6OQohSab9JA-1
Received: by mail-il1-f200.google.com with SMTP id
 h28-20020a056e021d9c00b002dc15a95f9cso897351ila.2
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a0VfoDzq8YoHMgYUM9GgDmVVbUPmxvxlahqSIHyPsBQ=;
 b=e1M5o/brnjvLlOVudxRn6ESn2HfJhVhq1jQvbbgFsLu3bXYio7QTApQTkdt4iLi98P
 MT4Aiv8i+KH9vWwOkQM6IBrXj19xTLhsV7pMbOVhN4ByVpCHv/hepUmjiP3PndvHcKNQ
 4Olwz1vhEGIZNFJsvZukiL8WE4ZHx4nnIYXnMrr0F+naZbkI3hp/u80hnpQWhOtfg4wH
 SXxsgQ0mgsDaPcxg2wt9CSZ9uKIhRYEv6+208cUuf8Q86mucApptwS23Fml6Wo2VMbR5
 OsgRTxTY+EMYeIpM5oG2MLnF6QolsJ/BE1JqwbEkwJEw9RY2ANHOX9LSk9ISOUD3lydW
 2nLA==
X-Gm-Message-State: AJIora9wxEZlxYPEFdU6U9/PiWxO+spoJOYn+sWRLPmEH1jo+wHnMJR2
 Tv2O9gG95Yuvz+w+eMz9KChCg6qsUTC5KGa+puGUPlQhvMT3+YXXRARi/t2JS2AlTa/IukxEzFm
 36Of5AFT62s4v4ZGDfOs+P3ZOoCRSHb8=
X-Received: by 2002:a02:c649:0:b0:33e:b970:5bda with SMTP id
 k9-20020a02c649000000b0033eb9705bdamr6984325jan.319.1656939661467; 
 Mon, 04 Jul 2022 06:01:01 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vBoOuQimBBnfeuo5+Y3pB3hXB5NheDsakiznUgG2bmuXPQ9V4Usq8yLRrMADOO6VOokLSz1DbAgATBJzEi4f0=
X-Received: by 2002:a02:c649:0:b0:33e:b970:5bda with SMTP id
 k9-20020a02c649000000b0033eb9705bdamr6984309jan.319.1656939661165; Mon, 04
 Jul 2022 06:01:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220509103019.215041-1-pbonzini@redhat.com>
 <20220509103019.215041-17-pbonzini@redhat.com>
In-Reply-To: <20220509103019.215041-17-pbonzini@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Mon, 4 Jul 2022 14:00:25 +0100
Message-ID: <CAELaAXxBkk-D4btqO29g22YCZicurs+ecpdkpEdOOAa3U_Gh1A@mail.gmail.com>
Subject: Re: [PATCH v2 16/26] curl: add missing coroutine_fn annotations
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

On Mon, May 9, 2022 at 12:08 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/curl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Alberto Faria <afaria@redhat.com>


