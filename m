Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD484389711
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:52:41 +0200 (CEST)
Received: from localhost ([::1]:51398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljSFE-00029Y-So
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:52:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljS1O-0001XC-RG
 for qemu-devel@nongnu.org; Wed, 19 May 2021 15:38:23 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:51894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljS1H-0000JE-LT
 for qemu-devel@nongnu.org; Wed, 19 May 2021 15:38:20 -0400
Received: by mail-wm1-x334.google.com with SMTP id u133so7878380wmg.1
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 12:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NHelpT2pjxDSE8XW9I+cO5tyED2XyOClOu/m8HxyhoI=;
 b=htBImEfnMZTLLQ0y0/qWjoFTS1eYSmA8xA6O69zh1TSzTB0aciZVKzA4EODC/cQAqV
 PdNocGCCaGWRCkTw9U5JrlDRlIzvfj6dac+JdHj8MLlXRtvZU16XbbQaL9L649mFkSq9
 qRSBuN9nEGqIkIaT+XWKcqrqCqZiFZdQQ59zbLnadJa877nyJE3j86fJanRnrnP5oRnv
 YdQu1cQts832NdMeZKZdrUZlkAq5+bnJXjpJNLpIdwHqurXV5ljW30HF0fTI/D8WF9rO
 8p8iYEl6mwH3AFUWpoz6oPFcwagtJqqLDPlU6qTkLRnuNFfowjUQgXmZSiMY7ASzBbi/
 IDmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NHelpT2pjxDSE8XW9I+cO5tyED2XyOClOu/m8HxyhoI=;
 b=ucGp9iuAnXYgFXnRLLJUGhDqDGJZgZKDqOfevispb7j+eWUmQAIvHXt2ked4kVzXT9
 rbOofhYmqE2ieVu1zmhs0bflkOxdnA8xeDD6pUo7pqCixdbEPeP7cyWjsFOBhM5aHNhV
 dJA19NveA2g8Xvj6f75whc0DnHAQSSQF1WXPHEHjwgu0BKy7y5nIQrAfgMGAW9hPV7RP
 pnw3ht+XiaZZD+lFRvfzbtds+fCkrWqILr4abj23NaZ+G7n7+PY+TL2zh7Z4eZAG17M0
 x99k/W5/IcVHApKFFMu+c0KNlHkXZphSg+NYlBSDRAWy6bY//aLPw4RXma0PCo32nMVo
 oAew==
X-Gm-Message-State: AOAM533Yw3pCZStai0kuteYzcuccs/a2mbJDaWtF/6biJJMZwUJg9PkL
 fTaFidT9RusUnOfwvg6/lEU=
X-Google-Smtp-Source: ABdhPJx11HJnUEF2zVqJU8vCKmSFC7L2IHZPDcF6BUerzbTUq4ojVoQr/fvP06l7WNZIPXF2YlKPSw==
X-Received: by 2002:a05:600c:28d:: with SMTP id
 13mr710141wmk.183.1621453093910; 
 Wed, 19 May 2021 12:38:13 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id c6sm385070wru.50.2021.05.19.12.38.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 12:38:13 -0700 (PDT)
Subject: Re: [PATCH v3 02/10] gitlab-ci: Rename acceptance_test_job ->
 integration_test_job
To: Willian Rampazzo <wrampazz@redhat.com>
References: <20210519185504.2198573-1-f4bug@amsat.org>
 <20210519185504.2198573-3-f4bug@amsat.org>
 <CAKJDGDbNZuicFLqKbHL7z7DqXnMbphQqcHh=YC72h6Lad8oxgQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <01a9372b-6246-2a75-5fec-8b3cb299d78a@amsat.org>
Date: Wed, 19 May 2021 21:38:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAKJDGDbNZuicFLqKbHL7z7DqXnMbphQqcHh=YC72h6Lad8oxgQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/19/21 9:26 PM, Willian Rampazzo wrote:
> On Wed, May 19, 2021 at 3:55 PM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> From: Philippe Mathieu-Daudé <philmd@redhat.com>
>>
>> The acceptance tests aren't accepting anything,
>> rename them as integration tests.
> 
> Kind of related, I'm missing a patch changing the name of the
> directory from `acceptance` to `integration`, but we can do it later,
> when this series is merged.

This series is focused on GitLab.

Do you mind sending the patch? :)

