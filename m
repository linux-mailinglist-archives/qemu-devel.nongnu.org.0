Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6AE2D89EA
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 21:10:07 +0100 (CET)
Received: from localhost ([::1]:35832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koBDS-000548-3K
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 15:10:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koB7p-0001KJ-TA; Sat, 12 Dec 2020 15:04:19 -0500
Received: from mail-ot1-f49.google.com ([209.85.210.49]:33263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koB7m-0006tq-84; Sat, 12 Dec 2020 15:04:16 -0500
Received: by mail-ot1-f49.google.com with SMTP id b18so11717545ots.0;
 Sat, 12 Dec 2020 12:04:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iyrFjcoISVU2lOWc2JKH9leEi+k90i5G/Fhgdjh9bAo=;
 b=KCGZTETkNsFHUhgjFtfLph7Ek3gK4Ay1u05QD36j4UDAXE+dUpdl4ZGrT+rcl6zvLI
 ETTxaJx8p/pQHVreOptUkzuWXDqiQGCXLyT1R3/9LMls62aE1r8sFYgskckqkm5dyrYy
 +gmwnSbfeIO9fuMMmiVpOJgeDGf8a890+fC6fdtTgD9IBhYWHXuI/NlD4qfg7Oav4TW1
 3wcOcK6k/5Brun3qwRZjtzB2DoUNWJDyavZgOacjkjiHZaIUBvclgRUrAdN71T2vpSjS
 i/sf9tUXOq7UtKIrkRfDiEnqMJf5CS6dglSN02T8F17Cs7JPsd9TmE0Sx/pAOx584E8D
 N3Bw==
X-Gm-Message-State: AOAM532OCZfy0haEuwbpCscd8JypTugcUuKg13NMQvaQkAXknfxkn26N
 C3KwCOp1z6nddpKC/SeRq/khilMLu8F2GFar+Vo=
X-Google-Smtp-Source: ABdhPJynmlz3iOLBXHvxmb5vJqcrbz3JjNBRKRn5GdGUc32s0kbW25D5rqpzne6HEq5gwG4dSfeirCJ6VLUQaTPDhwA=
X-Received: by 2002:a9d:4b81:: with SMTP id k1mr14546919otf.371.1607803452655; 
 Sat, 12 Dec 2020 12:04:12 -0800 (PST)
MIME-Version: 1.0
References: <20201009064449.2336-1-zhaolichang@huawei.com>
 <20201009064449.2336-9-zhaolichang@huawei.com>
 <f790ec0a-1f0d-90fd-f597-20fddad9a60c@vivier.eu>
 <CAAdtpL4dxKYxu=W3zboCaOuAiJeiV1SzOnPXXLxtoX_BkW7sow@mail.gmail.com>
 <f14ca245-4bc4-5d19-a342-2dbcd35470b1@vivier.eu>
In-Reply-To: <f14ca245-4bc4-5d19-a342-2dbcd35470b1@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Sat, 12 Dec 2020 21:04:01 +0100
Message-ID: <CAAdtpL6z-3TFzVtq1=8P+GQ+xeapMT-powOfjkF0k7JTKzo5GA@mail.gmail.com>
Subject: Re: [PATCH V2 08/14] m68k/: fix some comment spelling errors
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.210.49;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ot1-f49.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 David Edmondson <david.edmondson@oracle.com>,
 zhaolichang <zhaolichang@huawei.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Dec 12, 2020 at 8:58 PM Laurent Vivier <laurent@vivier.eu> wrote:
> Le 12/12/2020 =C3=A0 18:56, Philippe Mathieu-Daud=C3=A9 a =C3=A9crit :
> > Hi Laurent,
> >
> > On Sat, Dec 12, 2020 at 6:11 PM Laurent Vivier <laurent@vivier.eu> wrot=
e:
> >> Le 09/10/2020 =C3=A0 08:44, zhaolichang a =C3=A9crit :
> >>> I found that there are many spelling errors in the comments of qemu/t=
arget/m68k.
> >>> I used spellcheck to check the spelling errors and found some errors =
in the folder.
> >>>
> >>> Signed-off-by: zhaolichang <zhaolichang@huawei.com>
> >>> Reviewed-by: David Edmondson <david.edmondson@oracle.com>
> >>> Reviewed-by: Philippe Mathieu-Daude<f4bug@amsat.org>
> >
> > Do you mind replacing this line by:
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >
>
> Sorry, too late...

No problem, mojibake happens, not a big deal.

Thanks anyway :)

Phil.

