Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA0C3AD950
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 12:05:59 +0200 (CEST)
Received: from localhost ([::1]:43878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luXrS-000472-QB
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 06:05:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1luXpc-00029v-RV
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 06:04:04 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:41946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1luXpa-0006U3-Qj
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 06:04:04 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 y13-20020a1c4b0d0000b02901c20173e165so7237737wma.0
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 03:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ed0Gzz0JhmOxuthKpkOY4u8hFRpO1cTpnOg5kSOhGCQ=;
 b=g8+6BHnkybTG5psOIi3Ym9MaNIzdMpvS7d+3Vc+JO+SBoINEA47l9JeZqf3LCJfnmd
 eknDfjTNKRQHl/kGOtLo3zDUggJdOzkFhwdaQnE6hd+tjvF8eAR8MxDsAiXHsXzNN22K
 mRQQ+VrWnY9XDxLgx+ARu0av2G0Jk9oIr8+thsSmruqRE4neet9VImqpUhhO6PBvqgK9
 KEwpgMlPch9TOu6HKkqHOA1PbIhTT2VzcrfrM4ssMGNUPXex+F+FkmIIVDQGtYNrnrLx
 QVPzlkDSA8saQJofWiRBp5E011VaEgypPJaGxgA/lmJDS3oqzrzvE4VZrkQ6SKf+QWWJ
 GL0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ed0Gzz0JhmOxuthKpkOY4u8hFRpO1cTpnOg5kSOhGCQ=;
 b=MbSPddYudqn0PaBwf+ZFqep14BJDxqH/BIOXFvomNwynpsthkk5+igajMJ3XXEMoJg
 gPg+8SK4JabFgdobfZaw1STqPqsY6EeI5NycaOU57CQRerGeQuu/4g0YBBk8hmp3YhU3
 T4eICmZgeESuHT9IwgDnsuxzjhHVtrS5Bn9uUNDnUc2pEEIBUIDU2odNHp8dq4T8DzgV
 uUoiJPK2/RSfHrX6nv/VdosdHwMzzwWmbZ0PTgcbvICCsTbUzhEQa7BaQSsTNq9IOYZU
 /WdGbJqjWq6B0qwDotYCIfBDNGhRQF3pC20SOjALlXjhoidi3apzhBOrwtSUpzZ/F4Us
 nKBQ==
X-Gm-Message-State: AOAM530Gt5F3CmLB9mmoDgG2+Ys/20uYXVzG6z/ATxSgkcCq0KlyrndZ
 htymPvxd9LTsXcVfKrAhYvI=
X-Google-Smtp-Source: ABdhPJxBIkp8Q3F1+3iyu2w3gd2ZeuwjWEEmbqQ4hZuMUokRp6mkwdrmmfu/hb8uQaKCoItQtUjDNw==
X-Received: by 2002:a7b:c304:: with SMTP id k4mr15851000wmj.68.1624097041142; 
 Sat, 19 Jun 2021 03:04:01 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id v18sm11898720wrb.10.2021.06.19.03.04.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jun 2021 03:04:00 -0700 (PDT)
Subject: Re: Shortcoming (oversight) in Windows installer
To: adam.s@Safe-mail.net, qemu-devel@nongnu.org
References: <N1M-_seQmbowoO@Safe-mail.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1c25fadd-1f3f-b3ba-c2fb-d5654b6e6e29@amsat.org>
Date: Sat, 19 Jun 2021 12:03:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <N1M-_seQmbowoO@Safe-mail.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.202,
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
Cc: Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Adam,

On 6/19/21 12:55 AM, adam.s@Safe-mail.net wrote:
> Hello,
> 
> I'm new and can't use GitHub/GitLab,

You don't need to, see how to send a patch here:
https://wiki.qemu.org/Contribute/SubmitAPatch

> but I noticed this about the Windows installer:
> 
> Does not add (nor offer to add) "C:\Program Files\qemu" to path.
> 
> It should maybe be an optional choice in the installer.

Can you try sending a patch via email?

Otherwise thanks for letting the community know ;)

Phil.

