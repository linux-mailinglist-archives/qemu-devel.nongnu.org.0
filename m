Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E50676611
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Jan 2023 12:40:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJCDO-0004JC-Kq; Sat, 21 Jan 2023 06:39:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pJCDL-0004Ed-9i; Sat, 21 Jan 2023 06:39:15 -0500
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pJCDJ-00066c-IF; Sat, 21 Jan 2023 06:39:14 -0500
Received: by mail-oo1-xc33.google.com with SMTP id
 d16-20020a4a5210000000b004f23d1aea58so1418203oob.3; 
 Sat, 21 Jan 2023 03:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=//Yx25u/BbWrSjuyo97NIpzv+9idy1TjOm3HAEAdZWY=;
 b=CshppcU9i4F2eMZjOSlkpl/AUEvGTZBZzrz0Od2xaJCboGk1Yr6lSSO21Ih5XVuUbX
 DmZfbFLsboxTSyVH0mWqn1by92VS5q3vHfvKRUWXBk4IgCyeP/2KT7zCxPTYJ4z+jeCD
 w9/PlIyvchhiJx+YrV7wXFGor1yxEw2zdlp4ep8ZOrwvigCEhET7Uz3rS7bT9FicCVM1
 Pa++T8ra6ZXUKRLJl0epeU0WcNWmZSfQZyBigkRz3eoPbjW+lj335ViM7JuaCHBsB7J2
 VqIaTWoFsaLjR8bZZzEMNePF+i24n1g5LFBp3kyxAzCPiD7EcibqqnCl4wP54ESinLv0
 UUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=//Yx25u/BbWrSjuyo97NIpzv+9idy1TjOm3HAEAdZWY=;
 b=xbkh37YnOF4SmgxmhVkpX+jtAODIZzq9WjHGhE1UcoXoTXJFVL1ZaaXZNEWVKV8QDZ
 aeQeblKsJryioPOGauk1PtTi8l6mX4mU3AlcL1WZpkJCfPfRVDkCUeD79y09GFSQVH2g
 aG6fsrdHNeF761RXioD+1qUpbyoa0wPMx0s9ZMzHsDWGEIIHvQNUGQl2hkHpwfKeRzaj
 m2R95Wgawn8DWUdmWzlq+kWwEWZhIt90QIkgt3QceLe2ucG7qd5O0s1g5+0QQpaf9Rr6
 1PAVcTTB3SEPd/KGzWA1rY7V/dbbINMYtBYlBxZgzEhtEy0FXlXUcHHKu/Ar90xDAeBd
 OHIw==
X-Gm-Message-State: AFqh2kqkUSATDrViE1dUMQpakAHRfhXBP/seEaDzq5sUCCBrOF+lUVOw
 8DCEtwjKoLoVrbRqknXxW7c=
X-Google-Smtp-Source: AMrXdXv7B+uv/ad+QJ+MqeatlJR6pt1wmRo3wfoXPU6529KppAzz3N3/KMS8ecaKXu8kdIS2P5ZG6g==
X-Received: by 2002:a4a:bd99:0:b0:4a0:b7a0:2413 with SMTP id
 k25-20020a4abd99000000b004a0b7a02413mr8202782oop.3.1674301150200; 
 Sat, 21 Jan 2023 03:39:10 -0800 (PST)
Received: from [192.168.68.107] ([191.17.222.2])
 by smtp.gmail.com with ESMTPSA id
 r75-20020a4a374e000000b004f241603c49sm14019144oor.20.2023.01.21.03.39.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Jan 2023 03:39:09 -0800 (PST)
Message-ID: <835c0cce-ea5e-c9c7-fd6a-f0e6ebd7ed20@gmail.com>
Date: Sat, 21 Jan 2023 08:39:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 0/2] tests/migration: add support for ppc64le in
 guestperf.py
To: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Fabiano Rosas <farosas@linux.ibm.com>, mopsfelder@gmail.com
References: <20220809002451.91541-1-muriloo@linux.ibm.com>
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220809002451.91541-1-muriloo@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c33;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.089,
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

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel

On 8/8/22 21:24, Murilo Opsfelder Araujo wrote:
> The first patch adds sysprof-capture-4 dependency when building stress binary in
> order to fix a build error.
> 
> The second patch adds support for ppc64le in guestperf.py.
> 
> Murilo Opsfelder Araujo (2):
>    tests/migration: add sysprof-capture-4 as dependency for stress binary
>    tests/migration: add support for ppc64le for guestperf.py
> 
>   tests/migration/guestperf/engine.py | 28 +++++++++++++++++++++++++---
>   tests/migration/meson.build         |  4 +++-
>   2 files changed, 28 insertions(+), 4 deletions(-)
> 
> --
> 2.37.1

