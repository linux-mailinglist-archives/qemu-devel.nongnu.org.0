Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 154EF6066B3
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 19:07:20 +0200 (CEST)
Received: from localhost ([::1]:35698 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olZ0V-0002Dn-KP
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:07:01 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYpM-0001Ql-0l
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:55:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olXxw-0003Jf-At
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 12:00:16 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:37729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olXxu-0007Hi-6x
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 12:00:15 -0400
Received: by mail-wr1-x435.google.com with SMTP id bv10so35236211wrb.4
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 09:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fUywh7wiG5ARvxRTb1BgGNRCEcPxDhfqaa+CbK4TdEM=;
 b=EdVqCt72SHfxZv7s8HvcAcZYGho/6Paarn9Xs/F1gTclLy6gVYhifCGQVQDvPGlL+5
 w3UIin6Q4bKJH7qvhSA1qPkch8xAnZJXqPmNVLEWhxIqUJoeklAcWD0+0YG2Sf2Kmytf
 ACyvZgntAWJ4yAxxqMPgxtzjOhnglHKUA7MK0Kl+d6F678kIsln3X9Cl8K6AAtocCGA6
 s5hlMcWj4zDNVbzE4wDecLnmgNRVbExEi+dcyqhkF/eBGnCwNFIaTEkHn6KT8ev4KlMZ
 25V3eKaDwLHMHY6O5eaqmDjhDj4D99bI87+p0HMBl16Efp/snx5RcUAaJnISSO0K3MK5
 pvkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fUywh7wiG5ARvxRTb1BgGNRCEcPxDhfqaa+CbK4TdEM=;
 b=loq1kKtWyhH7YkAU3Rmqv2G9lXidfFEa7cxtmuOLEbHgMLUAr0V9w2L/Uiz3gVwIZK
 KR3hW7PbmCiWVYyWC+UHY5v4tCwZ0iMItet8mwLq1PCXR6GQLqjKLNt21Q3675fCNImT
 adgA/wY6Ct8nWbPfb29CsUSpegEh6587w4qAWSs4oPKA3uNAGguK54yio1B+atXXdBiG
 AY6BVXpxcch+elG1/qMZLiYQ5qB4Dw1ggtFEVmHTgQXY4kT5c2ItAy7PRviEH0o58Khc
 DDgPRV+w9Rb3lXuKFSw+msHgVy0YJhUqb1stXzb3jum8XQsdcIWvWkCucEQj0S4ulnCj
 DiYg==
X-Gm-Message-State: ACrzQf1cZyCEM4JuE+cOyruWET/Sxinck9wITdgUtfsYnQX6SxKsC3Bl
 h3lB6SPBJjt9a6wa8FlN3DRAbQ==
X-Google-Smtp-Source: AMsMyM7gds/dSeITwxRL+CPjeiJmyy19brLJiHjfw4m2PdpWBh6/UlFW799ytY09EnnJ4t6qhTrtJA==
X-Received: by 2002:a5d:64e9:0:b0:22e:7631:bcab with SMTP id
 g9-20020a5d64e9000000b0022e7631bcabmr9686806wri.36.1666281612028; 
 Thu, 20 Oct 2022 09:00:12 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 m14-20020a05600c3b0e00b003b4fe03c881sm158655wms.48.2022.10.20.09.00.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 09:00:11 -0700 (PDT)
Message-ID: <25b2af90-0f03-4817-7c21-6d55057c6a4c@linaro.org>
Date: Thu, 20 Oct 2022 18:00:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v3 14/26] hw/usb: dev-mtp: Use g_mkdir()
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Bin Meng <bin.meng@windriver.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
 <20221020115209.1761864-15-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221020115209.1761864-15-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 20/10/22 13:51, Alex Bennée wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Use g_mkdir() to create a directory on all platforms.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20221006151927.2079583-8-bmeng.cn@gmail.com>
> ---
>   hw/usb/dev-mtp.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


