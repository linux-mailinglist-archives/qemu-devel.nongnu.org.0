Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2545F2B7F
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 10:16:41 +0200 (CEST)
Received: from localhost ([::1]:50064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofGcy-0001z2-Ld
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 04:16:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ofGYN-0007vv-4g; Mon, 03 Oct 2022 04:11:59 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:43246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ofGYL-0006k4-Nc; Mon, 03 Oct 2022 04:11:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vST+N63r+OH896JzByvZ1ANE6YCL3ZVP/fn8wMmPrxY=; b=BvjYdjZgaEzBiGOMUwXPkMFQ04
 NZtuSyP4045jk/dmEc+4SNtNEEMZgnkN4i7VoB8Fnu8B8qQDqKdnZSUHpoetlLKhb/X46M3vW5CMF
 QWSqMCmobVMBu3LFA3mqrc5kOqgzweTmzH/U2a+ug8Ead0lp/Ll3TlMLxapodj3Z4XToqR7ugg/bw
 t6gymkVFCGcRKV96XdIoRi0Rn+/JP1yThNmAM/G3Iar/qpMT1exGfDUil+aRmdtWT+dU+trEV/ac3
 fXReYlpOr1IUV4VM8yJB8x3z6oi96RsCh51XIREehwDcCPc3S/YE1kam3BWMgiGG3gN0nzCISVJbk
 4A1CRmvMViNl/M2gooieayaAnPB0DIFuYJwdkCUkukADokOC8bHM5/Qrk7+MCRJXxXFXZbRWDojMI
 qKzvJzjq64IL++VNsyv4gsG8NO9qCj5fx47LrgZLlcNLPE2Av7MDBHq5AVNZiG8MoqeWtX98gqIMu
 7CQ+PYPAsMjyvg/CFsI6YfGgdaMjPTxRO9qZY2o5vaUYX3OtUwhhw8fjTPkWt1nt1KUAN7vagY47s
 MpFZC0h+4nLGWS0K2+6eLsme8+pJRru+vgNAALaUov8AZby+MjM9qdgG6Vs09/ASjnmbwczNHplDC
 diostoX1zewSyhGx/ZUv2daYKj9UW5SgRKYzp28+s=;
Received: from [2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ofGWa-0005UT-Kf; Mon, 03 Oct 2022 09:10:04 +0100
Message-ID: <349b1151-6c05-5e7c-9819-d6345cb53434@ilande.co.uk>
Date: Mon, 3 Oct 2022 09:11:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1664108862.git.balaton@eik.bme.hu>
 <6d15737b-bcfd-9fdf-2072-d906acf05a9c@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <6d15737b-bcfd-9fdf-2072-d906acf05a9c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 00/13] Misc ppc/mac machines clean up
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.086,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 26/09/2022 22:40, Daniel Henrique Barboza wrote:

> Mark,
>  
> It seems that you're usually push mac changes via a qemu-macppc PR (git log
> says that the last one was Jan 2021), so feel free to keep doing so.
> 
> If it's convenient for you I can pick them via ppc-next as well. Just let me
> know.
> 
> Thanks,
> 
> Daniel

Thanks Daniel, I really appreciate the offer of help - I'll let you know if I need to 
take you up on it :)


ATB,

Mark.

