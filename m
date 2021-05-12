Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F58C37D435
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 22:25:16 +0200 (CEST)
Received: from localhost ([::1]:41918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgvPv-00022m-Bp
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 16:25:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgv6P-0005y6-F2
 for qemu-devel@nongnu.org; Wed, 12 May 2021 16:05:05 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:34324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgv6N-000870-EP
 for qemu-devel@nongnu.org; Wed, 12 May 2021 16:05:05 -0400
Received: by mail-wr1-x436.google.com with SMTP id t18so24862114wry.1
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 13:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BkImYmcu4GtsjaR9W2SzTrb8O3eCS3h26ycLTAbUWJE=;
 b=HeYwTjOHoaVUm+STL/3b8yvyervS095pNcMETtzp77QsG8hjQ5mfncAQXW6g5h2Bk3
 QHC0hbkB/1eRkYoiZZ0ObU6qHRRInw7a5YyMJU9pNa887V523SZTMZvjUAGphE8GMNkJ
 qPyUqxs+/VJVe/nXTlQaN+DcSg+siOOEXGJTJjX/ulmoEQqYZYoS7Wyq9Ny9shjQYYXy
 U3GDFz1vCco8+MJQpLKsMPbfIB5LPPyn8MeQkVVxXbl0hxWW+mb6ZyafdztmLhjvx4Xd
 T1h3KDxiIJA9Wg5zYHtDMPhbmpHSCMMdUmQzMVEpMbyj9PV+r49uSS3H9f3m0mI2swnk
 3Fcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BkImYmcu4GtsjaR9W2SzTrb8O3eCS3h26ycLTAbUWJE=;
 b=KgKX8+ybWgAfvUGXyAKo2bR4TN9PJoyFWspGqyTg0bql5GZKAiwHJAm+H2miYhMRX3
 Jkf1T/z9YkEaq98dv0IJF0OWy28/HcqcL/7Bb0xWGdn6I0evQv3pXoX8KqLQOmxL/STp
 pfwJRpOx76PEg9YkGCHcpnX8sW13YpcyPnlBwKeFkmyBUHwxHhJvVBvSHkzOMOXgbjrW
 GVIDKQHjLHuUd8WP1LQk/LDCaejVTJmnGDfWpH7/wRg+3LuHlRA0g3jwrsF28KKwNCM1
 40z89vGmb03h/F92782y8pJJK/KTGVkso3mycpQPBi8EP7plbh7r6okw7JhBub+1pzDn
 Ao3A==
X-Gm-Message-State: AOAM532v8tPttMbDpQUWtKKXnr9pdHlN1PGp87SUGld9s0Tl8uWcuzIL
 NONdhKWE3u/oT53c08cl3u8=
X-Google-Smtp-Source: ABdhPJzInPqBq9KBRZtqnH3l5HsuRG4iD7hHG9FoObWmL031BZ1poXT7nrVFEmONDfd4c7UKxS/7Hw==
X-Received: by 2002:a5d:64e6:: with SMTP id g6mr46633687wri.216.1620849901090; 
 Wed, 12 May 2021 13:05:01 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id f1sm782929wrr.63.2021.05.12.13.05.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 13:05:00 -0700 (PDT)
Subject: Re: [PULL 2/5] Remove the deprecated moxie target
To: Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org
References: <20210512162412.338120-1-armbru@redhat.com>
 <20210512162412.338120-3-armbru@redhat.com>
 <a8c579c8-e361-e3ef-0f4d-d902e12c7525@amsat.org>
 <b696a2c2-1a95-8442-1b2f-2b7e02f6ef0d@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e0be626f-f2ef-71a0-bb6e-ab566a74519a@amsat.org>
Date: Wed, 12 May 2021 22:04:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b696a2c2-1a95-8442-1b2f-2b7e02f6ef0d@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: peter.maydell@linaro.org, Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 7:07 PM, Thomas Huth wrote:
> On 12/05/2021 18.37, Philippe Mathieu-Daudé wrote:
>> On 5/12/21 6:24 PM, Markus Armbruster wrote:
>>> From: Thomas Huth <thuth@redhat.com>
>>>
>>> There are no known users of this CPU anymore, and there are no
>>> binaries available online which could be used for regression tests,
>>> so the code has likely completely bit-rotten already. It's been
>>> marked as deprecated since two releases now and nobody spoke up
>>> that there is still a need to keep it, thus let's remove it now.
>>
>> Isn't it already in a pull request sent by Thomas last week?
>> (I ask because I based a pair of branches on it)
> 
> My series got stalled because there were issues with incremental builds.
> But Markus series here has a chance to get through since there are also
> changes to the configure script in here, so this could cause the rebuild
> to trigger correctly. If this pull request survives Peter's integration
> tests, I'm happy if the moxie patch gets merged this way!

Ah OK, thanks for the explanation, great then!

