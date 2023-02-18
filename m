Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 849A669B7A2
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Feb 2023 03:01:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pTCWP-000645-BA; Fri, 17 Feb 2023 21:00:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jeb.study@gmail.com>)
 id 1pTCWN-00063s-Jb
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 21:00:15 -0500
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jeb.study@gmail.com>)
 id 1pTCWM-0001zx-5W
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 21:00:15 -0500
Received: by mail-qv1-xf31.google.com with SMTP id dk7so3056744qvb.6
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 18:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RsVOgtyGjFH3rWeUXvJ4iHIS52HHtWmU4paXMeeE7Hw=;
 b=H+VdEPYPTu6mE+FFxVkDwX23M0mxuzATTAyHHMw4nyDDa0WgZg6SHk77eyqb5FgKD2
 huZl/npiOBPjMqK5Elb/4rW4qpzKLtwirW2PWK4F5DwcoYHc5s8P8uOsrLq8ovG5cEto
 f2kvwP7Kgq2xauU4ppIlf8GTYlzzkGoobM2gupRXvQdJ9CKYIDxxhTXc+VSZJexq+yv+
 XerbLRr9S/aAv5i8kk2vFvc4Oq3Ttu1/8ZCPixuPA4Qt3Pk7+sQ8qaxqD9EtcrOs+N4x
 l68ugF3ebtX+hX349UvNywZnYDPyOQf7k5D3uYMMnQCQRsNtbFJrKSe6fbOc+ayJTfRr
 g8Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RsVOgtyGjFH3rWeUXvJ4iHIS52HHtWmU4paXMeeE7Hw=;
 b=zaGAnw7JDnF9dmfP3B4RvAWMry/b2f+jkxSU1rbhFe6VP/w260oeK25U5QML8StqTs
 tl4n+UptCVCX63LHqWovJcUUdJ63B87N1OLRnyw45apW7LeyJhKb4icsMewNajMVL9jI
 PMV6sT2b7hQUlB/4B5ghYgFQh1FJwjKrMXuD2qyxI8eq1r9JnNZwwYyts6iGVtg2JOg5
 EJ0m/AB6RtE4niPQdLBRUkwzonyX9lBHTg5sGIPw5Kquhw6UADtdKB+TeGQK8BEQ7M0F
 geDScfE90OUG+cb/fJh5s+TYEFEN/XTcZNfzNGvv5OUGuXiOpXKxRnZ010ZObMOMH4Ie
 mP1A==
X-Gm-Message-State: AO0yUKWfrbWK1mndsF4hsil7jw9eglgHcjneKMht9KTA5pqVB4S8/Sfx
 EXWFZmcemROfVEWi9BNsWSU=
X-Google-Smtp-Source: AK7set/tD1EnKGZWHOf4igKPGc/iwNuKKH5ocb5cd70JTCY5JtWSJ+oXzr2fFGDrV0y4KWVuYkeSpA==
X-Received: by 2002:ad4:4eae:0:b0:56b:ee5a:89eb with SMTP id
 ed14-20020ad44eae000000b0056bee5a89ebmr5001629qvb.19.1676685612413; 
 Fri, 17 Feb 2023 18:00:12 -0800 (PST)
Received: from [192.168.122.139] (c-va-670e04b2c1-836-1.tingfiber.com.
 [216.30.189.152]) by smtp.gmail.com with ESMTPSA id
 o62-20020a374141000000b0073b676274e7sm4352606qka.94.2023.02.17.18.00.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 18:00:11 -0800 (PST)
Message-ID: <12107bdf-f631-e42a-5136-59bb67e301fc@gmail.com>
Date: Fri, 17 Feb 2023 21:00:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2] Fix exec migration on Windows (w32+w64).
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20230116013421.3149183-1-jeb.study@gmail.com>
 <CAJ+F1C+x3tSHAb6LbL+GK0m08UuKCS0RWygz41gMFycqL0JrrQ@mail.gmail.com>
 <Y8UXR6uqdv22auoE@redhat.com>
 <db09ab65-a6a7-0096-625a-c323a4b5aacf@gmail.com>
 <CAJ+F1CKkqcgCYfnGVK7LSD5gE1ueX2HrCGqP26_UJZYt3E-q4A@mail.gmail.com>
Content-Language: en-US
From: "John Berberian, Jr" <jeb.study@gmail.com>
In-Reply-To: <CAJ+F1CKkqcgCYfnGVK7LSD5gE1ueX2HrCGqP26_UJZYt3E-q4A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=jeb.study@gmail.com; helo=mail-qv1-xf31.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.256, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

ping. Is there anything I can do to help this get merged?

Best regards,
John Berberian, Jr.

