Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5D031FEC8
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 19:28:37 +0100 (CET)
Received: from localhost ([::1]:48032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDAW4-0004Ww-A0
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 13:28:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDAUw-0003ks-AW
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 13:27:26 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDAUu-0002YV-LH
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 13:27:26 -0500
Received: by mail-wr1-x435.google.com with SMTP id 7so9852289wrz.0
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 10:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6w0ZesKv1INOQ2nMQqY9/+WTZODZL86LyiI0NSUR9JU=;
 b=DcY2bjnkXWK3TPqqFXZWm7lHUj+EDOIuHV9mYhSt7yBMK9gGZ8zLceG4VYljeM71Lh
 1FXewvOJYgxj7uPlVmLHDRT8wuWp04T4qbxt/y2W7R7NOY5upDYLoLi4vzHa7xqFLA22
 NGzSQHU/b40v3cZTIGffBsoFJKkfERe0pq2g+mRPGaprvMFRFWDKbGG1acoMxwDfzRHG
 67bJkYWvB5OKpuLCPL9SehgIwBzTIy8DG63Y5S3DQXwpeauonmQLSwOl7Kz0Xr/aqyHc
 LHaHTYtMLbfi5gO2TCC5I02FKaB8Ryc7UaZRJOtmIKKPiUXVWo/c357EE+VTdmpfIMeb
 zfhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6w0ZesKv1INOQ2nMQqY9/+WTZODZL86LyiI0NSUR9JU=;
 b=TaCTdJGkBws6CeNXZWdvJDPbnX+yDWLHAX/+e6WxW+NuvbyMPal9kHWyp9cDf0PPvO
 NxWa1cx/m7s9rmXX/UOfJyWI784kT3xcdhS6L4V5rN8MUtJ26R3UjYt4GUENXTxGfRHf
 2duoCLTRNwJqU6T8mZafU1+BkEZgA821yuKHpFH6AvBhRb1p48eocM8peQhPJSXDZSw4
 2r88ncZnIilUSg2Mh8aJqXRnyCwYL4hs2RG+nQuVPu6QH+WpOByQpX9YFJksbeeBzUHW
 tBYHHqMYkQbWZH7FCUHre/NWWMqc41TIbmCeOZCeeA2RskW22XoiFxDosgLIOGa/ROs2
 x0Xw==
X-Gm-Message-State: AOAM530W+o8OXfbGp6TzAlksLoApyCiYwSk38M7fmy+8IhUckxRbZsbh
 B15l02ed+KZBPS9ROarGAUs=
X-Google-Smtp-Source: ABdhPJwn9eGo5EWNzBnkkkY48L0R9w0eetbd7EI9QqFk3nVUVHEFQ2exG6xJ6sEUwhV3cQ87NnkWww==
X-Received: by 2002:a05:6000:1565:: with SMTP id
 5mr10630776wrz.109.1613759242476; 
 Fri, 19 Feb 2021 10:27:22 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id d15sm14508497wru.80.2021.02.19.10.27.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Feb 2021 10:27:21 -0800 (PST)
Subject: Re: who's using the ozlabs patchwork install for QEMU patches ?
To: BALATON Zoltan <balaton@eik.bme.hu>,
 Peter Maydell <peter.maydell@linaro.org>
References: <CAFEAcA8h8QVoGsfJCLTYnbk3yzmrtphsWdSsDUrgQkB=vGh3zw@mail.gmail.com>
 <efff5920-3fd7-581d-d92-42b1b21ae66a@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6213ed02-5dae-20b1-7c4d-d28824d433e3@amsat.org>
Date: Fri, 19 Feb 2021 19:27:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <efff5920-3fd7-581d-d92-42b1b21ae66a@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 7:07 PM, BALATON Zoltan wrote:
> On Fri, 19 Feb 2021, Peter Maydell wrote:
>> Does anybody use the ozlabs patchwork install for QEMU patches,
>> either occasionally or on a regular basis ?
>> http://patchwork.ozlabs.org/project/qemu-devel/list/
>> The admins for that system are trying to identify which of
>> the various projects are really using their patchwork instances,
>> so I figured I'd do a quick survey here. We don't use it
>> as an official project tool but it's certainly possible to
>> use it as an individual developer in one way or another.
> 
> The "How to submit a patch" page at
> https://wiki.qemu.org/Contribute/SubmitAPatch#If_your_patch_seems_to_have_been_ignored
> 
> says to send patchew URL with pings. Does that make it "official"?

Thanks for the reminder, I updated the patchwork URL to patchew :)

