Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED085683026
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 16:00:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMs10-0007R8-IN; Tue, 31 Jan 2023 09:53:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pMs0r-0007E8-SH
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 09:53:34 -0500
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pMs0q-0007aa-2k
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 09:53:33 -0500
Received: by mail-lf1-x131.google.com with SMTP id v17so18676223lfd.7
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 06:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+CnfKq0zPfgqgNhzzSi0tVgE7k9x+5r1ultIo3eSfxE=;
 b=aiI19o2witss8hTp07ll6OO3xUMnojPDAF8dO8/zsFJNCyteknHA0MstslPEqYFKZx
 oUmfEVGbyTRDhmIJnP59FUTRxxLeNxY4YCfWNjyJaj/k2+ncfrrcWeM0CvoUdfBiJ3/8
 RqHPEOVT8OqNAeBWWWYsc5cVFuJ/F/vaUlDK805jAHKy7jwhkHJk/ROgvwj0cM1O1+zM
 l4nEVWqxmxt2+7OHIJlPqL06dsEYiMgj8WuqmgCFt/WFm1bljihZYo11IbtSV2uAqJyr
 /G1lNUC8UwCCpCJIfa1FZsm5Jt5mUsoR71GCNbUbcwq+FvybL68xp2kuOTr0i3iX9zCu
 NykA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+CnfKq0zPfgqgNhzzSi0tVgE7k9x+5r1ultIo3eSfxE=;
 b=mcSxNMnIp+scItdFO3CCjnG4EiVho7/1KxTu5XVGlxDgGKgQoHz9v1zZPlyiS6WQqV
 sd1SyOmH/slMRDwSB1h5Qk4KyeddiGS0U+RK4Pu9Etz41hffiMZFTgCtgzNi3Y14MKtD
 jQt/9UlYMUzEJW73sOA3X45iZJMt73vqhvMjjkZTAtxnwGwHfSKA1Ai5z05e8EQMWOwH
 xH5lTM3ssPqxZoPcIABY+yyb/bcFokLm01xc/hqHXApZNeaoXfMgNR1VyHp9NiZJ2lE3
 +0aZaK4Rs1AFU8gLCQnELMo1vesSHnmn46nYt1+1F5RBEG2TlzbN6otoUttpuGGrWtQu
 0J+A==
X-Gm-Message-State: AO0yUKWppzhACwKOMfrtBMWlOOAsXLRRz0Sqx7M9vs9kAc5XkC4scjbR
 AiDUs8PYtx1qU/GjSbQhDLghIao0m19uVpFhSRI=
X-Google-Smtp-Source: AK7set/nf0x+z+uqNmj0ntKNv8jjs0A9XPljS5p0oq9pUgwb4oQyPghfR+vj6VbLGyo99mAt1TBK58S5cNQkaZhmtfU=
X-Received: by 2002:ac2:5985:0:b0:4d6:d63d:bfab with SMTP id
 w5-20020ac25985000000b004d6d63dbfabmr3104624lfn.80.1675176810090; Tue, 31 Jan
 2023 06:53:30 -0800 (PST)
MIME-Version: 1.0
References: <61bd351f-0683-7f58-b746-66c9578a7cdc@t-online.de>
In-Reply-To: <61bd351f-0683-7f58-b746-66c9578a7cdc@t-online.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 31 Jan 2023 18:53:18 +0400
Message-ID: <CAJ+F1CLWBs6raV8vDAOXtZ8x8HxsYRC_=H8eNttsotG2pE=JYA@mail.gmail.com>
Subject: Re: [PATCH 00/17] audio: improve callback interface for audio
 frontends
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi

On Sun, Jan 15, 2023 at 5:10 PM Volker R=C3=BCmelin <vr_qemu@t-online.de> w=
rote:
>
> Based-on: <3b1404eb-a7c5-f64c-3e47-1397c54c45bb@t-online.de>
> ([PATCH 00/11] audio: more improvements)
>

Something didn't work with patchew
(https://patchew.org/QEMU/61bd351f-0683-7f58-b746-66c9578a7cdc@t-online.de/=
).
If you could rebase/resend, or share git branch that would be great.

Thanks


--=20
Marc-Andr=C3=A9 Lureau

