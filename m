Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EE0341E1F
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 14:27:39 +0100 (CET)
Received: from localhost ([::1]:55564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNFAA-0000bb-Ry
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 09:27:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lNF7r-0008HO-Au
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:25:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lNF7p-0003I2-OM
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:25:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616160313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6iqW29n8PutI1qW6ISANlhLcnKb6IOpRCRxFE5kuc8w=;
 b=ZOkfyOFad8HtGq//Z7yxwXAoFHZnMcvLIViTSCROIbvbRHdJWeAxlrS+2IrdUpRmBhPNrW
 SaCkDpz28xDnlBM/5Dpn/oFfVO1WUUt0cckrP1YdZ/1gBhYxR6+10L9y76931TvkMBBJBX
 ZyqgHz6VdZogAboEj+hoqVCVwyNSNd4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-nABVHi4-MrW1-_wRmkGy-w-1; Fri, 19 Mar 2021 09:25:09 -0400
X-MC-Unique: nABVHi4-MrW1-_wRmkGy-w-1
Received: by mail-wm1-f69.google.com with SMTP id s192so12934381wme.6
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 06:25:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6iqW29n8PutI1qW6ISANlhLcnKb6IOpRCRxFE5kuc8w=;
 b=LkLMuIISuFbCODHUvlgIJn+bzBYElgfLiTZK2lXGkLrpCpRBz/fneEorNRDX2tFJkU
 y0d29Ihe0j+8oG5sZkkX47dWCDsijOWfklY/BAXUUKtCVU1ZD8Yc5cpC/eoNUL5OsGbC
 Fb5zeu6RPCOz1rEWiWCtlG1L/Nl2pLQFtfakCqEXuVFNcveS5f3/zmcUHED+OaI0Sya0
 sePiAKhQtZi7PKuyZI7JJkByysMlmU9gOWliRTE1ki10Zc3TYbaonhuOsuaTeuRW5E8p
 enmmPCcILUHzF3dpccMWjZPsGAgxAtNJ0AT34UwWJd1U2OI4KKD6MwDz5Y4VJnHDDjCk
 ecHA==
X-Gm-Message-State: AOAM533ymC6iyskubcgZ3AHyCIgRjlRnAXq3hLqlyG3w11+ii7C3UDMD
 SccdY1EjwS1qciIzv1QOzfwKnIjhZbQiOBbnKSmKkK/v2tpRMdUG0wSKsV/mEoNcc4AZxd6GuiD
 PlKrDzV+Yw1AvsZQ=
X-Received: by 2002:adf:8b5c:: with SMTP id v28mr4531556wra.272.1616160308303; 
 Fri, 19 Mar 2021 06:25:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZAYTz/tzHwO70Um1VtpWq9guofFgoYSnsOShswZkls3fHJw3zZCKUTJUqXCfxbWhRrdbO3w==
X-Received: by 2002:adf:8b5c:: with SMTP id v28mr4531538wra.272.1616160308152; 
 Fri, 19 Mar 2021 06:25:08 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id j12sm7973231wrx.59.2021.03.19.06.25.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 06:25:07 -0700 (PDT)
Subject: Re: gitlab-ci: cross-i386-system job timeouting
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, "Daniel P . Berrange" <berrange@redhat.com>
References: <e34b63a3-87e6-ff84-0a4c-306ac6091120@redhat.com>
 <77a34c82-8c80-3f9e-2afa-bdf3dc3269b9@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <586a9860-1f01-20a1-9c2f-249a40ccde8b@redhat.com>
Date: Fri, 19 Mar 2021 14:25:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <77a34c82-8c80-3f9e-2afa-bdf3dc3269b9@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Willian Rampazzo <wrampazz@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/19/21 12:19 PM, Thomas Huth wrote:
> On 19/03/2021 11.56, Philippe Mathieu-Daudé wrote:
>> Hi,
>>
>> With all the recent pull requests merged, I'm now seeing
>> the cross-i386-system reaching the timeout limit:
> 
> I just took 53 minutes in the main repo:
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/1111677521
> 
> I assume you were just temporarily out of luck ... but let's keep an eye
> on it...

I clicked on [Retry] and it succeeded:

Duration: 13 minutes 26 seconds

I'm lost by this 1h20m0s -> 13m26s difference...

Any idea how we can distinct between broken runner
and broken test?


