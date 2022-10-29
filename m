Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0206124B7
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 19:40:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oopn4-0008DY-1b; Sat, 29 Oct 2022 13:38:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oopmy-0008Cq-Ls
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 13:38:33 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oopmw-0006hG-UJ
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 13:38:32 -0400
Received: by mail-wr1-x42a.google.com with SMTP id k8so10480692wrh.1
 for <qemu-devel@nongnu.org>; Sat, 29 Oct 2022 10:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mD0vQ7lx4v91sQldjSAzM7wWl2q8MAz9pIxZQfshjaU=;
 b=dzRCENklr+RHhjruGUFPFj5oRnSeGkvJ8DhR0iDj6Io7eKAGRW5op4B63FdQ6Q4FzX
 7ldxXFuiXlEe1S3FWMUG63sfLqajF3rjtB+wKlKY96vjvbN2tLIgXRSKuOVlnDo6KpoL
 wHX/2lNH8bRf9krsd0vQWrzR7GTc7P8SYuLuL2R+NFXfVVrMEDK33oI2FtZLMrJ5Mkeu
 ntCwpRlibNl+/N6uZwZhaMsiu1H8BAWtb79Wz8lcKlXSKxTOehk5bnqTXzFP+HEQWEL9
 0VfncS27ZbUfYr/9/r9jmDMT+RNyx/TDtGO3fcajupTUcq5zxZ0rccKCOa3LkLv4QuvD
 gkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mD0vQ7lx4v91sQldjSAzM7wWl2q8MAz9pIxZQfshjaU=;
 b=I0ZxPC+xym/2xu5Y7D1F8iSOl0bligvpnZckvLsERM8r6zDg65e7hBOAFEGcMIGZeK
 hyNJ0T+bSUMOk7wf9dAFqbV9ORFyNQNOOpYgOZolNlEc9l0sJiU434aYR65owftyGARn
 KtepzaTJgplupM4D2sjHba9bM62g/lyJNgBsbx/oR6VeFFoOeZYgZNr9d3xcUdte9Ulg
 uoz5iT1wvUyQlJCFkdbZgngMRcqUJ4cXWerFW8JPXpUbiG9UwA7DlFYfCAIPDRxNqr01
 23Lb2UJnsGAkjdeRIOIu5/2BOIse9mdjRzIK2Z3VUWzYDXkaPPE1FzI0WmicbBZNr0uL
 TUYA==
X-Gm-Message-State: ACrzQf3XiSDPiT1FRD+iFt6DRUfxHEvJdfY+agCqn+HJD4T6UbE+Gekf
 uexxtEi31lZAC2P3bY30sCB3dQ==
X-Google-Smtp-Source: AMsMyM6zttN1NbnB4pAUmTE0lYqOhBSmQ871tpaXlQp0ZMZWIJJfx2UoDrDQKW8QOvLFFauLbT7ikg==
X-Received: by 2002:adf:e610:0:b0:236:737f:8e5d with SMTP id
 p16-20020adfe610000000b00236737f8e5dmr2939597wrm.316.1667065109021; 
 Sat, 29 Oct 2022 10:38:29 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h5-20020adff185000000b00236863c02f5sm1982892wro.96.2022.10.29.10.38.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Oct 2022 10:38:28 -0700 (PDT)
Message-ID: <bb32d789-cf34-d605-630e-321aa91c3398@linaro.org>
Date: Sat, 29 Oct 2022 19:38:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH 0/3] libvhost-user: Add format attribute and fix format
 strings
Content-Language: en-US
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220422070144.1043697-1-sw@weilnetz.de>
 <46857c41-3a6f-ca04-8bb7-3ce3d1eb2c8d@weilnetz.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <46857c41-3a6f-ca04-8bb7-3ce3d1eb2c8d@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 29/10/22 06:52, Stefan Weil via wrote:
> Am 22.04.22 um 09:01 schrieb Stefan Weil:
>> At least the 1st two patches could also be applied via qemu-trivial.
>> One of them missed release 7.0, so hopefully the fixes will be
>> included in the next QEMU release.
>>
>> Stefan W.
>>
>> [PATCH 1/3] libvhost-user: Fix wrong type of argument to formatting
>> [PATCH 2/3] libvhost-user: Fix format strings
>> [PATCH 3/3] libvhost-user: Add format attribute to local function
> 
> Who will send a pull request? All patches were reviewed, but are still 
> missing in the master branch.

qemu-trivial?


