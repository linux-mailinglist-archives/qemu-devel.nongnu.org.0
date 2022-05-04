Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5A351AD56
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 20:53:15 +0200 (CEST)
Received: from localhost ([::1]:49984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmK7e-0000VO-6I
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 14:53:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmK5d-0006nq-BR; Wed, 04 May 2022 14:51:09 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33]:43173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmK5b-0004Jr-Qe; Wed, 04 May 2022 14:51:09 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-e9027efe6aso2092854fac.10; 
 Wed, 04 May 2022 11:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=JATX5xjbTKXfKwO6tXxgF1NXbHkc65OAqKXiRMsqWTc=;
 b=lg6XMENoRpVBvZ2SZhGOZQK6abHrWREDh2sS3Hzwf+KqJpSxKZrfGcz3BQQ4/Hrbf8
 Ps4uZUpgP4OxbbwakBwOlH9QAiMpVPqLP1uwDJR0TZ5oN2OEV7JQDnxWAQDrOw+W1mrn
 HUOnpGWg2ma1sU6dIeQ2OzNCUYzNbjpRVTiXCDKMqxGA9SM6sqLBMKQ86IWSsBdonesQ
 iXTOhppklN2G7fzgIO8Q+50VccYfAkndJT1kC34O1TzjiNiHA/3K8OUmDJmlK438FI7H
 ikvMQ+JPPciZlsTZkDgrDY/2nQJWNIYSXLMmlSfLdIpZnkdfKrbGRnWOt8wZIXyWRdf3
 kfbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JATX5xjbTKXfKwO6tXxgF1NXbHkc65OAqKXiRMsqWTc=;
 b=E5+k+rNC/WipUqnWfrF/D76LdT0ri4cKHBlGUB/4CvCcK2PMm7OC23yRV2vbk6z7cq
 6xPmwChRlK30jmtIGsPV0ioRqJLpsmAi/jkSOBBmrpE96bXl/btKrYoEqPlkmTxboA1/
 SdVwk0EyJNfAbBsrih4XgsZnmImgar6RJgICwdUSryiY9UkQkzk58jFxcjBey1q5ZqDA
 hK5bCswZfCos55VR8QvBoq3wwWy6E2atkDasDwyOja6NneTUEPaRocEahdzjcWs5kTJ6
 BRXdOfXWmZCDW50po7Y3SYYFTjHZlG397q7eAzdR6jvxHho2m7IXrUpAp+s7gLir4xJB
 CBPA==
X-Gm-Message-State: AOAM531Yqx1XVAFbHoY60n2JRxo6+9MC6fHeJrHUqmoSELFsoX4K8FFl
 DpR3ZtRcpJqjjhAraXdQ00VjLQOrcbU=
X-Google-Smtp-Source: ABdhPJzn6tA7UwC7WU9AhI079deVw3VtiPLH0oxzxaS6enFm+tQ96HRKAEZq+5Icta0jelOuS3ovYQ==
X-Received: by 2002:a05:6870:f5a3:b0:e1:944b:6450 with SMTP id
 eh35-20020a056870f5a300b000e1944b6450mr461733oab.254.1651690265674; 
 Wed, 04 May 2022 11:51:05 -0700 (PDT)
Received: from [192.168.10.102] (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 l21-20020a056830155500b006060322126asm2607464otp.58.2022.05.04.11.51.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 11:51:04 -0700 (PDT)
Message-ID: <2583ba83-ddb8-08aa-413b-c2ab14438887@gmail.com>
Date: Wed, 4 May 2022 15:51:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 0/1] Coverity fixes in hw/ppc/spapr_nvdimm.c
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org
References: <20220409200856.283076-1-danielhb413@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220409200856.283076-1-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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

Ping

On 4/9/22 17:08, Daniel Henrique Barboza wrote:
> Changes from v1:
> - clarified in the commit message which kind of errors we aim to prevent
> - changed the H_HARDWARE return to g_assert() exit
> - v1 link: https://lists.gnu.org/archive/html/qemu-devel/2022-04/msg00569.html
> 
> Daniel Henrique Barboza (1):
>    hw/ppc: check if spapr_drc_index() returns NULL in spapr_nvdimm.c
> 
>   hw/ppc/spapr_nvdimm.c | 18 ++++++++++++++----
>   1 file changed, 14 insertions(+), 4 deletions(-)
> 

