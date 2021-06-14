Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA923A6D64
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 19:45:13 +0200 (CEST)
Received: from localhost ([::1]:52704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsqe8-0001k1-Hl
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 13:45:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1lsqbq-0007vx-LH
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 13:42:50 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:36176
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1lsqbo-0002Lb-4m
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 13:42:49 -0400
Received: from macbook02.fritz.box (p57b42637.dip0.t-ipconnect.de
 [87.180.38.55])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 18D39DA07C5;
 Mon, 14 Jun 2021 19:42:45 +0200 (CEST)
Subject: Re: [RFC] GitLab issue tracker labeling process: arch/target, os, and
 accel labels
To: John Snow <jsnow@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
References: <0a19af15-2f34-4934-c6c9-113e49f5f1f2@redhat.com>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <c9223394-e1b0-4ed7-e095-62c44149ebae@weilnetz.de>
Date: Mon, 14 Jun 2021 19:42:44 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <0a19af15-2f34-4934-c6c9-113e49f5f1f2@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.489,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 14.06.21 um 19:32 schrieb John Snow:

> RTH raises the issue of the "TCI" subsystem of TCG, which is not a 
> full accelerator in its own right, but (I think) a special case of 
> TCG. If I keep the 1:1 mapping to ACCEL_CLASS_NAME, "accel: TCI" is 
> inappropriate.
>
> Some suggestions:
> - "TCI" by itself, simple enough.
> - "TCG-TCI" or "TCG: TCI" or "TCG/TCI" or similar, so that it shows up 
> in label search when you search for 'tcg'.
> - "accel: TCG:TCI". Similar to above but uses the "accel:" prefix too.
>
> My only concern here is completeness of the label: this one seems like 
> it's at particular risk of being forgotten or lost. It works perfectly 
> well as an organizational bucket for people working on TCI, but I 
> wonder if it will work well as an "issue inbox". Intended use begins 
> to matter here. Your thoughts, Stefan?


I appreciate your, Richard's and all other efforts to further improve 
the label system.

Regarding the label for TCI I have no special personal preferences. The 
above suggestions are all fine for me, so choose one which fits best to 
other labels.

Thanks,

Stefan



