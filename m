Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9987C56577F
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 15:36:49 +0200 (CEST)
Received: from localhost ([::1]:42432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8MFs-0002B7-KA
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 09:36:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8LkX-0000cd-Rs
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:04:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8LkV-00007R-Qo
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:04:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656939863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4T8hVJRT3I/3QlC2HwnAcFZIKiYLH7plI4s6jQo/XdE=;
 b=ZU2I4gfxVQ4NePM2GHbXUVtSu/K3FZ//JVSedqCkcm69Qiur7qVictMwhI1YVUc+w6cIME
 SDUqW1elk27kLEY4Zp4vJkfMkIY1PvKSHYnMnrqpX6eVn2lnbA/AGm2Ftr/N5u+etiL2b4
 emtnr43pJ6Y8x5uJx/Ijf/m24OzYqxo=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-KckAHSMQPX64XaTYXjcSqA-1; Mon, 04 Jul 2022 09:04:22 -0400
X-MC-Unique: KckAHSMQPX64XaTYXjcSqA-1
Received: by mail-il1-f198.google.com with SMTP id
 x5-20020a923005000000b002d1a91c4d13so4207477ile.4
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:04:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4T8hVJRT3I/3QlC2HwnAcFZIKiYLH7plI4s6jQo/XdE=;
 b=JEigPmIsLKKI7aZ8qvthlljoTK04u07PHWu3K+hGoQSMsnEGpa//h5lCtVgxsO9SG7
 Y/VkfpCbWWJ84LFWhz/4mdLZe7kVgSz/B6lbeJM1Ul1OnJA0I00jHvJmiIsi4QoT3UJL
 6Ab75R+rzaKkZK0c7JgO+Xpgl2k8z5FF23hBP8GYFSg8IF+DMC/GjiMD6rlkXBDHgIrF
 SDpOXH3deVuVD+fcR9DHOcU/wWr78R+tZ24ER/HeFkAa1sOG+BQ/XaXGzXP5UuPMhfIX
 k1XHlJJu3hvM828K6Tlf9x5JNSnQGCAONwbY55SP9uaglXPtHk8LbyOFiAj1hvDcF55H
 /EYA==
X-Gm-Message-State: AJIora8HYq1jynhVGuWP/WjLWOju9x8HxIKi1I9L3GdYDBxuYNEInj1/
 wRdD1CBnBqyonlOCaae091YMAul0qzbsFymboUh3R7SmC9Vxg4/2ECaBAr1vB07v802CSbHpxHT
 eNedV5KzLYoODbqhu5/T46ST1aG84VWw=
X-Received: by 2002:a05:6638:339c:b0:33e:b766:1bf1 with SMTP id
 h28-20020a056638339c00b0033eb7661bf1mr7563434jav.93.1656939861427; 
 Mon, 04 Jul 2022 06:04:21 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sGVNBZ5DOOjGo9xf2bo77pb9JOpSiB7lN1O4DSRhM1/NXntrhDQaKJRpbYTEqlD1XMPpQBNhegZjik1wOjfn4=
X-Received: by 2002:a05:6638:339c:b0:33e:b766:1bf1 with SMTP id
 h28-20020a056638339c00b0033eb7661bf1mr7563423jav.93.1656939861244; Mon, 04
 Jul 2022 06:04:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220509103019.215041-1-pbonzini@redhat.com>
 <20220509103019.215041-27-pbonzini@redhat.com>
In-Reply-To: <20220509103019.215041-27-pbonzini@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Mon, 4 Jul 2022 14:03:45 +0100
Message-ID: <CAELaAXwhdtcgn=MXVLZ6T9ZTF-6usLr7SnFPZp4nnsprf4FDzg@mail.gmail.com>
Subject: Re: [PATCH v2 26/26] test-coroutine: add missing coroutine_fn
 annotations
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, May 9, 2022 at 12:08 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Message-Id: <20170704220346.29244-4-marcandre.lureau@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  tests/unit/test-coroutine.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Alberto Faria <afaria@redhat.com>


