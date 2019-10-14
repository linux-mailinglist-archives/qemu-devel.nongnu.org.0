Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0373D687D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Oct 2019 19:32:14 +0200 (CEST)
Received: from localhost ([::1]:54588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iK4Cb-00067G-KE
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 13:32:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45751)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iK3lS-00052v-Tf
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 13:04:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iK3lR-0006e7-Ru
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 13:04:10 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:35184)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iK3lR-0006dt-Lm
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 13:04:09 -0400
Received: by mail-pl1-x642.google.com with SMTP id c3so8287600plo.2
 for <qemu-devel@nongnu.org>; Mon, 14 Oct 2019 10:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=brbr1mzwjXmvv417aG3HnH/oWh9+2TVZEyNL8/qhPaU=;
 b=yuyFUOS3vNmbeChjgnxitUCd3NS6KM/sT1rgSNZFHtJ3A3G86M3BNDzCzPF3SRsKYv
 yWIbjcCXnAKymJmfmoVcodDMHNnpgglKN7E0DHXbPgghz4sTf65EGJdFly+DvF6aft9e
 vqjwwfQEo35vWlCbwJ24k1d/6DzyuWJ5/d/jKk5hjwxHZvzgmeOhkkxI0WoeeBMrGVgY
 5c7A0jbEWPhp57AJe8jo9CIftRzan2gOp5Ewg77NDBePbdCM8QkiUKncuhAy0DQ7TarE
 OI0paFl+FeyJfus2pbooWCOFGCXl6Lva6hUIykdSDw8r6LF3e1ua6qv1RTvYg/D4GU22
 nZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=brbr1mzwjXmvv417aG3HnH/oWh9+2TVZEyNL8/qhPaU=;
 b=R8yD6aN9fxOF8RjriA8HLeoqhGB2y+n3y1213ce2WDMM5GYDA/hdkf/3QJ6mDLeQki
 BtpXt2AL4+fdcm/arsCabzo75dCOo8tmu+dLz7NppRetrKTrFXlXsrA7Xl9qsuetBtEi
 5aiEGZKh/w0WNCFJz+xvSUDTSoDQSDG6tl0BtMzJpqmcKSDQtW59a3zyuS/i2YlTzrO2
 cYsXFSpDYu/jPA5IvR8BiWguiKspcUf7N5UZTrvCRs+/Z7+zmgHUswlg7dkV0L0GCuU3
 YnWzeky/RseYgm593uWjk6dJoO+tzFCL7uRGW9XK/xDefJUuU/JumxH6s7stiVym9ekE
 dAyg==
X-Gm-Message-State: APjAAAUHeUo5UZM4B7uauw8hkxrB//q/hgxeKgxHPZYQVBoKnStqwP00
 tsO28HEASn1gizHNmmH/BYRijg==
X-Google-Smtp-Source: APXvYqxgNvYOJl8RwFftY442J6DNnN+dFHDBa38SWjxZhoR4FKuD9HTrHl3RETisy+h3rf11h8r1dA==
X-Received: by 2002:a17:902:9888:: with SMTP id
 s8mr22014803plp.193.1571072648631; 
 Mon, 14 Oct 2019 10:04:08 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id l24sm18983501pff.151.2019.10.14.10.04.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 14 Oct 2019 10:04:07 -0700 (PDT)
Subject: Re: [PATCH v5 55/55] .travis.yml: add --enable-plugins tests
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20191014104948.4291-1-alex.bennee@linaro.org>
 <20191014104948.4291-56-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <37cb4eed-547f-e46a-864f-478293909c7b@linaro.org>
Date: Mon, 14 Oct 2019 10:04:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191014104948.4291-56-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
Cc: Fam Zheng <fam@euphon.net>, robert.foley@futurewei.com,
 peter.puhov@futurewei.com, aaron@os.amperecomputing.com, cota@braap.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/14/19 3:49 AM, Alex Bennée wrote:
> check-tcg will automatically run the plugins against most TCG tests if
> it is enabled in the build. We exclude sparc64-linux-user for now as
> there are pending patches that need to be merged fixing it's fork
> implementation.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> ---
>  .travis.yml | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


