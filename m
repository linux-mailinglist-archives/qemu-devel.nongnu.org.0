Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9717A63EA37
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 08:20:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0drO-0007ye-Rz; Thu, 01 Dec 2022 02:19:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0drF-0007vh-AL
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 02:19:46 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0drD-0003YW-Jn
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 02:19:44 -0500
Received: by mail-wr1-x435.google.com with SMTP id bs21so1239568wrb.4
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 23:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BpQNr0R17v3ysrF5L9SYCwzDWPsAGycLdwim60kJKSs=;
 b=yMqY63ewoiiazKscXUbtyIa2QON4vAWsOJz2A5u6MUKxv74EpAdg1WVJBNxGwdM+zR
 515QaxbBmufMceC6Y3AJ7kk0Zuu70CHOj9JRUp4nr1gTZerg95KCuBDQL+1bk0OdfSLd
 SxvLk57q/Wby4kNIdWDmapwVeR0pWu+vAirsSxjh5w2Guq3T+ng7Yj23huit96FCLssQ
 NJiYbFWyQRrC+yazDC3iJvPdT8v/nJ8eikTvQ/5K+NaC5VqN2cdsa3gI+i4xtyQikz36
 ouo7A0JUrkGCWkXrbhhAaoJEcyk1ZydVc3ri7UIj3/jhJhysRAmGNRH9BWn2iip+4yg5
 /5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BpQNr0R17v3ysrF5L9SYCwzDWPsAGycLdwim60kJKSs=;
 b=DQTTR3fHxwezmQJLMEexf+zAG4Zlbb79P/lD0ZoB1LpzgZxz7kZ/a+Hd6vPgeYad+n
 3igGYvyJctUKlGdtQxo718RHtn3T1xkvKU7auFP4Oj5vIJiJshwnsUWZt3dl2/FMZW24
 ejVHRljGBuyfvsQS7+cjk/qCF9BAVS1Tkw5w/LIivJElC1TsEBUN6QTU/Kv4/uqLDfHx
 tCid0+JJY0C+Suc04QQTT1UJGqjH6nhveeXwEHkVAkCXLdFYuh+y48kv8o1c2PILMzis
 2zbfD8G1TkpxXTsHhPyLNU1QdsYkIfdL2dZQ6KCdtG/mIdxAm2M0qN8GkXaSQxRf3BS8
 ZIQA==
X-Gm-Message-State: ANoB5plaPpdX609vam01b97OyH//5gpBX1/vfQ+PVTwFSTYa8UmvV9HA
 KrQ8ojJ3BuRhdHC9dKTLxGFJyw==
X-Google-Smtp-Source: AA0mqf4MIL3Nkroka2QTSmohANlANn/TMJGXK92rOfNZRLUdbfMw7vQmtlWJH7XbDm2hENvtUDoTvw==
X-Received: by 2002:a5d:510b:0:b0:241:fe9d:fbf4 with SMTP id
 s11-20020a5d510b000000b00241fe9dfbf4mr21395475wrt.412.1669879181630; 
 Wed, 30 Nov 2022 23:19:41 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k9-20020adfe8c9000000b00241f632c90fsm4155460wrn.117.2022.11.30.23.19.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 23:19:41 -0800 (PST)
Message-ID: <6ca45df8-ee5b-6796-1dc9-b822da4331b0@linaro.org>
Date: Thu, 1 Dec 2022 08:19:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH 9/9] ui: Reduce nesting in hmp_change_vnc() slightly
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: kraxel@redhat.com, dgilbert@redhat.com
References: <20221201061311.3619052-1-armbru@redhat.com>
 <20221201061311.3619052-10-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221201061311.3619052-10-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 1/12/22 07:13, Markus Armbruster wrote:
> Transform
> 
>      if (good) {
>          do stuff
>      } else {
>          handle error
>      }
> 
> to
> 
>      if (!good) {
>          handle error
> 	return;
>      }
>      do stuff
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   ui/ui-hmp-cmds.c | 17 +++++++----------
>   1 file changed, 7 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


