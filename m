Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0353363EE3D
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 11:44:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0h2X-0000AB-Lp; Thu, 01 Dec 2022 05:43:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1p0h2V-00008c-Nk
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 05:43:35 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1p0h2T-0000cm-87
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 05:43:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nOpPkn3dqKBbni9mAq955tzg8Ug+CzcUwGM0B45KUJY=; b=XUpgUNOMjaxodnrGCtB9rrkMLF
 12Ej4i6p+bthRSLMXWRsZ9DP9vjGO87sd4s4brmnwTaPFVpCh0LvbeYgWdLPXiBjEvMAwRuTyqfuy
 CppgaixhoZ7bwDQtVR+iHnXvFXTiqczxZGi6+eN2BPjE9BMzEty+C91j/b4agJAfWj9yFURB/2ctF
 0xl26iL5RJY9gv8GLBalpMtb0ScsRM9FpV1EMrT5wU2EqTfwX+9NciXRxzv62+pnGSMnFUNGPpsQR
 cdfZFpLNUyxIQ4YsBcpUK9gWHvrJRWLALkfkZgrUM4i/lsp27biS6OkUFm9UWAdlNkFWU+yTX5FSd
 zvIGblud8vRqTmLrm/QJ71IxSmhl2OnfSwmS1xSkZTvUsndq+EDyESPSQWNpY1HDEn9ReOh7KvkaT
 LuLoZoYmlkCi3QgNrP2TflaAs1VlZ9vaJy3Dq7ncB2011ALNvOhPe0yPwDz6XjMEglpbQXhm5Xfx0
 lrs2haX6X26T+kF8KPJZe30ChEMqGCLI5VLMoaiL0sOLdPn8smORFJchIXnGQ4PdaZtiXKMHtA97Y
 5E7omAmR7hTL5J4Pzqos9TeN4UneYmCfSzb6fkSMooWdr7L8v3zbVGFC5OzcP5t6Qmahiz/JSwMX7
 JlwzsqGs1z/GhN94qf7oOZnhL8KN1b4jZzB5OGTkM=;
Received: from host86-149-46-27.range86-149.btcentralplus.com ([86.149.46.27]
 helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1p0h2E-0002yd-6V; Thu, 01 Dec 2022 10:43:18 +0000
Message-ID: <f5e192ed-1d2d-53f2-c00c-7557acebca26@ilande.co.uk>
Date: Thu, 1 Dec 2022 10:43:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 peter.maydell@linaro.org, alex.bennee@linaro.org, qemu-devel@nongnu.org
References: <20221130100434.64207-1-mark.cave-ayland@ilande.co.uk>
 <20221130100434.64207-2-mark.cave-ayland@ilande.co.uk>
 <452cfbbd-d1a3-270b-b9d2-ae23fd8d35ec@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <452cfbbd-d1a3-270b-b9d2-ae23fd8d35ec@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.149.46.27
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 1/1] tcg: convert tcg/README to rst
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 30/11/2022 22:12, Richard Henderson wrote:

> On 11/30/22 02:04, Mark Cave-Ayland wrote:
>> +   * - eqv_i32/i64 *t0*, *t1*, *t2*
>> +
>> +     - | *t0* = ~(*t1* ^ *t2*), or equivalently, *t0* = *t1* & ~\ *t2*
> 
>   t1 ^ ~t2
> 
> The only typo I saw, fixed while queuing.

Ooops! Thanks for spotting and fixing.


ATB,

Mark.

