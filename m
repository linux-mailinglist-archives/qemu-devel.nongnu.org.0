Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BED5A4CDFA3
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 22:13:53 +0100 (CET)
Received: from localhost ([::1]:47700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQFFI-0000MG-Tg
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 16:13:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nQFEC-00086R-N5
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 16:12:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nQFEA-00033u-BA
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 16:12:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646428361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R51oADLOiPp1ia3mZt3LlEMogvpSym3jHdW4znUdQAo=;
 b=eksxEe0ozTLMR/hAECINfZlMi1eEzMMiy8g2jAY1fMYLZfJM6fYRhk7grF0wxNEkdBlVkT
 Y6SYAd5dv+pSfyljFbhacZKp9Vu77bibp+G5cSqsMh7z0JvkT47aJtoFMTx0YZ5qAKjamw
 uKMp03X9UKET1eNpDlvjkn7DczceUOY=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-ixqkWCvXMiCKJZmptAIYFg-1; Fri, 04 Mar 2022 16:12:40 -0500
X-MC-Unique: ixqkWCvXMiCKJZmptAIYFg-1
Received: by mail-yb1-f197.google.com with SMTP id
 o133-20020a25738b000000b0062872621d0eso8485075ybc.2
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 13:12:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R51oADLOiPp1ia3mZt3LlEMogvpSym3jHdW4znUdQAo=;
 b=WHAaLwfs614KwgJyCL9jvpwOWVoR2dMhThFPs3cGBcN/vjlXZ02GpXHf7Vnt436chB
 2FO3P+GcexX2VRGIR9V7QPp3MUIvfwjd0LglrGYXU3c4xIJ7sP0y4s0McHofbpNJq61o
 cf0qunPAn3dYb6kvNCha4GpC++Y15aGHowvfbRWoqOg/IX2mM5/kta4oB0Lgl1Yx2U+U
 F0KM4XFNMGAgVCV8T/ClDlfE8/6XHcTL1yBcnhnNTKFY8j3ufEaVy311AYlb5I5X/I7C
 7d0UT4djfjFrn6sS7ZHmzxfSv0mTEA8tncASCHOTtcpfaLfD82pQVV5wlMJVl/dl1NpZ
 jcZw==
X-Gm-Message-State: AOAM531HR3j4s2xodFgCdC+cMEoRfJdPsUDhdhMwhJX08lysGo1gxPpH
 w54gHEYq7ifFAvuZXmt32jNgSFn6CJe00s6VqHsZGBqNBmgcLbz9QkvnvRWYuXx4S4oy4u4uZPN
 QpFPdPiFx0n3w61kmKmG/k+bQyU5ABgA=
X-Received: by 2002:a25:84cc:0:b0:628:d4ad:8f33 with SMTP id
 x12-20020a2584cc000000b00628d4ad8f33mr362317ybm.559.1646428359823; 
 Fri, 04 Mar 2022 13:12:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw0rwVGpEsERV87BZJDYbmdCi3jNhfSxXVAbhdd+9pMpatNfzkf9rg+NX6iqQEFLOfsxfMAitsguQJQq2XIiEQ=
X-Received: by 2002:a25:84cc:0:b0:628:d4ad:8f33 with SMTP id
 x12-20020a2584cc000000b00628d4ad8f33mr362299ybm.559.1646428359659; Fri, 04
 Mar 2022 13:12:39 -0800 (PST)
MIME-Version: 1.0
References: <20220304152704.3466036-1-marcandre.lureau@redhat.com>
 <20220304152704.3466036-3-marcandre.lureau@redhat.com>
 <0de2304e-7902-dc63-4a77-b16786beaac9@linaro.org>
In-Reply-To: <0de2304e-7902-dc63-4a77-b16786beaac9@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Sat, 5 Mar 2022 01:12:28 +0400
Message-ID: <CAMxuvawR_jVUNKg+GrAX=8k-5GNDGvd1Po0PrH1jG=JZphWSSA@mail.gmail.com>
Subject: Re: [PATCH 2/4] qtest: replace gettimeofday with GTimer
To: Richard Henderson <richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard

On Sat, Mar 5, 2022 at 12:50 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 3/4/22 05:27, marcandre.lureau@redhat.com wrote:
> > +        g_clear_pointer(&timer, g_timer_destroy);
> > +        timer = g_timer_new();
>
> Why not g_timer_{reset,start}, instead of destroying and recreating?

Well, that didn't seem much easier, as that opens the question where
to create/destroy. And we would potentially have a "running" timer at
creation time, which could be confusing.

(btw, just found that doc : "This function is useless; it's fine to
call g_timer_start() on an already-started timer to reset the start
time, so g_timer_reset() serves no purpose" ;)

thanks


