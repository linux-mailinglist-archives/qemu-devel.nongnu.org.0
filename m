Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6609DA4E1
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Oct 2019 07:00:29 +0200 (CEST)
Received: from localhost ([::1]:33948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKxtk-0007dM-Fd
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 01:00:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58545)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iKxsg-0007Bv-Pv
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 00:59:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iKxsf-0001sV-8g
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 00:59:22 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:42554)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iKxsf-0001rZ-0U
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 00:59:21 -0400
Received: by mail-pf1-x42c.google.com with SMTP id q12so803881pff.9
 for <qemu-devel@nongnu.org>; Wed, 16 Oct 2019 21:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wbJUgvdPw4o/ZaQmfUkJ2vrlSHfCJ2AoGdVg0J/aX28=;
 b=vHMsTzn1R4YHHAJokSzTaJOAE1XL0hNzGQ7tcg3QmDrrI8vISaEOjm7sDQbqnB1F7l
 UPMQhnCdQrap9SlCrTvR4LTlezpQ2JKg6croCWzOeCUCmtckwU9glKFG0Fgj1+IZoaGW
 klqZxBzKM4+QrMSFfWyswUeTfd3ewuZvKiY4uFwcPIiq7IjCGkaSs6tMQE8jBnBUvLC/
 kx2s7DWCoBeV5VydhyuUvy+rpVQquZIKoIOFJeeKWZ4NFb/+3fqNVxYzbx1EnVG1vS43
 fCy6kvPAkZD+DT+YHcpe8greDR3zjpN5DaXOwKPj2GFRi3HS3Oe8Z4VYzClbUd5Hdsc5
 jCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wbJUgvdPw4o/ZaQmfUkJ2vrlSHfCJ2AoGdVg0J/aX28=;
 b=Li9aK8yXLtGDnpyPW708jbHxNwDD9F+WXhL3HlKIwF8vxCGnZ7yNuTHMO9/EQPbEEU
 eUZx0hMJM0WPyhzQJcUwgWg8VT70UT9o5QMYCKhNFVbziP8zasfeaO6flce254iGjKiV
 Wz3N5debdycbOZePkqDA/On5H69HOIAw+/6mdJefpW0mYzhCQ29Xlf3HRG/dUkFWCJUp
 /n/A4/Pn6ZlQT96TBRebNx29rigqRjI4oPD/AuZmNKfgbjhWvKVgBLuHkdpAQeTPIVJt
 tm2ZsEdC1ldPJ8Wjn8+laG6j9DeltMoFMonukdauIeCa5hIPeNmHxpdKZxgsLJ6vxEa3
 BKXg==
X-Gm-Message-State: APjAAAUGbsuTFG0fJlZOx/0cMDfIBcXCGtY4H/Yn+H8ViLyO9qglRmP9
 vovOuYxi4Tv9Xo6CO3fsKJAmMw==
X-Google-Smtp-Source: APXvYqxYg+/OJ+yA5j7FYWXlmKK3Qo+L4DYW/aLgmVSho63vk++TaJOvckLs9l7itNoHg+avAQlGQA==
X-Received: by 2002:a63:1042:: with SMTP id 2mr2025936pgq.59.1571288359636;
 Wed, 16 Oct 2019 21:59:19 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id r28sm963278pfg.62.2019.10.16.21.59.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Oct 2019 21:59:18 -0700 (PDT)
Subject: Re: [Patch v2] checkpatch: sugguest to use qemu_real_host_page_size
 instead of getpagesize() or sysconf(_SC_PAGESIZE)
To: Wei Yang <richardw.yang@linux.intel.com>, pbonzini@redhat.com,
 philmd@redhat.com, eblake@redhat.com, thuth@redhat.com, berrange@redhat.com
References: <20191017004633.13229-1-richardw.yang@linux.intel.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <38e97e1c-1730-12f1-0a9b-9caaaf7dd397@linaro.org>
Date: Wed, 16 Oct 2019 21:59:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191017004633.13229-1-richardw.yang@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::42c
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
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/16/19 5:46 PM, Wei Yang wrote:
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> CC: Richard Henderson <richard.henderson@linaro.org>
> CC: Stefan Hajnoczi <stefanha@redhat.com>
> 
> ---
> v2: add "\b" for better match, suggested by Richard Henderson <richard.henderson@linaro.org>
> ---
>  scripts/checkpatch.pl | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

