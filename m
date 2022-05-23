Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DEE53118C
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 17:18:11 +0200 (CEST)
Received: from localhost ([::1]:54430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt9ow-0002BJ-PL
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 11:18:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nt9fE-0006R3-6r
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:08:11 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:39481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nt9fC-0000BT-ER
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:08:07 -0400
Received: by mail-pl1-x633.google.com with SMTP id a13so2843640plh.6
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 08:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=TOSjLvdO99vx5dltE7HY7kCbW4/uvuMNU8W3t9yW/rA=;
 b=gkdbriwidQ7lz3YQcwEwkMkqRFbS7nGbOs3EJ473cd8rU51k3O4X/3xim3Ae5PMHup
 UeAJlT7A4abu8J7ljAWMuypr0ZSzeqpyUZY0zLV4aYi4IGYHuBSAOGi1XqSP+es3y+gP
 Gddrl8MJ6x2sc2EsSa1X8d+VpQ2cn6PCFMyxNQjOOzMpTD2aFW322taD03s4+C2C0Jjv
 LLKiye+PDDk8GoC1jnq+wl7CrIl8CtQ/5gBU/ZXWflXrt+xjbEvfX3HnswdiTL4okyX2
 8lhzZGcgmPrSnk1y7ZBb+WGkk1J3z3uS1qwLX1VKPVXTwS0CfYGRrlPwBDl9j4XgjGeY
 LROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TOSjLvdO99vx5dltE7HY7kCbW4/uvuMNU8W3t9yW/rA=;
 b=jMtdauCqzVOXLYEL9DHgZ5x6oL8bNcWlxL7oISkq+2VEJztLhIBZvSeUzkFBdmMtAg
 Ka1Ts+ZpVvPhGx4uV4zUek1f44deem2jHNIxI0249FJSlDRMn2x+zyYw/M8x/SQfYPNC
 KSEEk04ptwAXw9bI2GcUh+oNc+WZ1XLWF74/EOAZKrFnujJzp6KIqRtuMxkyF91psV8/
 RuMg2RkxHSA0Bhcx4nJcxOqtPZvtPRs56zmhAaHk+JMMRb+KmqTgsHLv2yyQMHxBx0hA
 dV5N2d+BLg8ukxIvyIp6zbZWARmw2zmFTnuaC7wR6PSBeI1DgWcyMdqUJXUxojmNQyAw
 Ip0g==
X-Gm-Message-State: AOAM532fp+G3uM4Ynv5kwsw3GE8gDdxfRNYMF751oBJ4coZwgjD1kLul
 NVlIcPlUswr6TCKaktS1xJ0wsg==
X-Google-Smtp-Source: ABdhPJwOj8atsteBZ+NsTpU7l8wh7OCHu/OTChvZOmMA5HzpgdZxR0vUg/gA+5245X4ByJOkhGovGQ==
X-Received: by 2002:a17:902:7783:b0:15f:21f8:a1d6 with SMTP id
 o3-20020a170902778300b0015f21f8a1d6mr23236823pll.66.1653318484073; 
 Mon, 23 May 2022 08:08:04 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 y3-20020a170902b48300b001620eb3a2d6sm4483058plr.203.2022.05.23.08.08.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 May 2022 08:08:03 -0700 (PDT)
Message-ID: <a8f5f61a-c976-e48f-48e1-e87fecd61901@linaro.org>
Date: Mon, 23 May 2022 08:08:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: proposed 7.1 release schedule
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
References: <CAFEAcA80ABJ+RXFeoH4mo5yJk5oNh4Zc5QTBN35vVOL4eg0cNQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA80ABJ+RXFeoH4mo5yJk5oNh4Zc5QTBN35vVOL4eg0cNQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 5/23/22 02:53, Peter Maydell wrote:
> I just put some proposed dates into the 7.1 schedule page:
> https://wiki.qemu.org/Planning/7.1#Release_Schedule
> 
> * 2022-07-12  Softfreeze
> * 2022-07-19  Hardfreeze. Tag rc0
> * 2022-07-26  Tag rc1
> * 2022-08-02  Tag rc2
> * 2022-08-09  Tag rc3
> * 2022-08-16  Release; or tag rc4 if needed
> * 2022-08-23  Release if we needed an rc4
> 
> Does this work for people? I just worked backwards
> from a final release date about 4 months after 7.0; easy
> enough to shift it forward or back by a week or so if
> that works better for some reason.

Shifting later a week or so would be better. I'm on holiday from 13-22 July -- unless 
someone would like to manage merges in that period?


r~

