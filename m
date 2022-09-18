Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E4F5BBE80
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 16:39:04 +0200 (CEST)
Received: from localhost ([::1]:35680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZvRn-00020m-51
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 10:39:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZvQE-00008A-4j; Sun, 18 Sep 2022 10:37:26 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:41651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZvQC-0002Uc-LW; Sun, 18 Sep 2022 10:37:25 -0400
Received: by mail-wr1-x42f.google.com with SMTP id t14so43330626wrx.8;
 Sun, 18 Sep 2022 07:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=NCjMhtGnscURG7oR3bfbKpo9JYVPlmZz2G8wJ907E6A=;
 b=VZQUC4G55Iyfbvi7/JyT5C4SZmYDwAqsZT4m0foV3YIY78aUvtzjC6hL5nYukxikyH
 +2ANBRYA2rbvDvAlyDS+jxa2hpzrZpNeU2Fe/Vnd/NsP/I4cto+LQBFWQ/D/JAa/JoNY
 sAUXotP4OXfUZNavcur7q+OpfX9nOJy3KWCKGFjNITdsz7nRW3rqRACh3hBOSOknm1JE
 iE2tzcO5p8prPKBNJJYFqz4GrImEEE3yDucd/MULDOwjOTbIRTudRCJwZg3BriV5g4PP
 Wal0xbgvttsAbntnoMzbhp6Gka6YdnCykRcozA6WJ1CZHhf7RPbUXRMQT3yE4l04ReTI
 kd8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=NCjMhtGnscURG7oR3bfbKpo9JYVPlmZz2G8wJ907E6A=;
 b=mho+UNm3ViirXRWZYefhLQrcItRbCNBSFxVVnfk3H5YT72ioTcKG7L2fJuu0lky44k
 cEoNsbyl9JJ4hJ/ZKQqgKC7Qe7P4QRWHQz/B3iRnKT7tDo9MHQtMgobD2hTCDJ4szGCR
 jwQuHFkSrqR9Z2bxKuCMNO70JJucUgDvNSXAh9d15bX8ugSgyP8ma2q5sbp+1JPmOx/q
 9yUJOn6liqh7L9NttUgzU65tv9CZP2hcHXUnFaWaBbKeqMTgpr6EGgnnkKoOznJH8flH
 EVGFzLpYgA9apSpehZVNMUNMTq1h3HiXIQUf2C8sSyAqPk9GU7H+Sb1WUuU698IGDgXw
 wMRg==
X-Gm-Message-State: ACrzQf0FfCNXihBOVVueBB2yYbxgjhobsxe98wZ7yn6HaG6H8OBKe621
 ymq85ccD95/7ooHxapF6G2Y=
X-Google-Smtp-Source: AMsMyM7yJJZarfJVIubKkPMkcmImrknfod8xFEFuC5U3Acf51O8Dw5snU/6TmDige+vQuigIsqQk1g==
X-Received: by 2002:a5d:6dac:0:b0:22a:fbff:b2d3 with SMTP id
 u12-20020a5d6dac000000b0022afbffb2d3mr1217560wrs.543.1663511842479; 
 Sun, 18 Sep 2022 07:37:22 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 y17-20020adff6d1000000b00228d6edade0sm10922060wrp.46.2022.09.18.07.37.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 07:37:22 -0700 (PDT)
Message-ID: <4d6bd47a-1e62-1de2-e6f6-a0f77c56e9f4@amsat.org>
Date: Sun, 18 Sep 2022 16:37:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 00/11] ppc/e500: Add support for two types of flash,
 cleanup
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>, qemu-ppc@nongnu.org
References: <20220915152520.21948-1-shentey@gmail.com>
In-Reply-To: <20220915152520.21948-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.657,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 15/9/22 17:25, Bernhard Beschow wrote:
> This series adds support for -pflash and direct SD card access to the
> PPC e500 boards. The idea is to increase compatibility with "real" firmware
> images where only the bare minimum of drivers is compiled in.
> 
> The series is structured as follows:
> 
> Patches 1-3 perform some general cleanup which paves the way for the rest of
> the series.
> 
> Patches 4-7 add -pflash handling where memory-mapped flash can be added on
> user's behalf. That is, the flash memory region is only added if the -pflash
> argument is supplied. Note that the cfi01 device model becomes stricter in
> checking the size of the emulated flash space.
> 
> Patches 8-11 add a new device model - the Freescale eSDHC - to the e500
> boards which was missing so far.
> 
> User documentation is also added as the new features become available.

Future possible cleanup: Looking at the e500 component, the MPC8544 GUTS
added in commit b0fb84236d ("PPC: E500: Implement reboot controller")
was used in hw/ppce500_mpc8544ds.c board, but in a later refactor
(commit 4a18e7c92a "PPC: e500: rename mpc8544ds into generic file")
this file got renamed as hw/ppc/e500.c; having a MPC8544 specific piece
in the common e500 seems odd.

