Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D08D6850
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Oct 2019 19:20:37 +0200 (CEST)
Received: from localhost ([::1]:54320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iK41M-0006ud-6T
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 13:20:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43365)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iK3SB-00050i-Qy
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 12:44:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iK3SA-00070K-6E
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 12:44:15 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:38077)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iK3S8-0006zV-TF
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 12:44:13 -0400
Received: by mail-pf1-x442.google.com with SMTP id h195so10707367pfe.5
 for <qemu-devel@nongnu.org>; Mon, 14 Oct 2019 09:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RpKVYd7PPFbFrn7iAM/FKVlOdy+xxB2Flc0/ezdTbtw=;
 b=ot9uHiKkEvSF3cFGnLoQ0IlDaOXQ8aFLiAEkzPmnMJmop4XLsAlmXtgd641wXAaUjc
 qumynv9z1eeO+9FuUVDGs4qO8A2ANKlk0+2TC2uOC1S44YJ5nAlC+Y07V8AwHsQB/AZ3
 sBvNUbyOwkP3CazH4hFsBth2SXHmLCW0iGBtXvySFezJx0J0JIiajn76LGadqcT9QvOO
 07oyVnQ3dD5aiu0cUdsLsHJ9r1ru/EpYcopl4NQTx+F9nLxZ3ipfazi4SeuMhk8EygNd
 QL/Kl7EtwvtSNLVPGyY37edZXgDoMDxhsq24sF7T2FqQLngXFApW9h0yqEbHVbV7IpP8
 0AhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RpKVYd7PPFbFrn7iAM/FKVlOdy+xxB2Flc0/ezdTbtw=;
 b=MpYRfEgbC2e2dPIauRYC/SAU8+XHfkrT6p4CNlmSmy+RKtVibsHrq6tLSrYokLmFtf
 qsbwnnFCOdGPeFYIqWfeeuLXo27f/sDIXNdn71QVgZZ4ajS8LTNv2JLoRWfszbUs5UES
 h9ME/ZQ9a4j3qdvo8XmP36Uh29zw9m61sJOxK9NFLJta1+jlOv+UmmSDphA/kDxflY4E
 c4M+k7SwNKZ1J5ILD2Qp6RQ+Xw4KCnN/TT1Cu4zzPOL4v8sW0ZYPynG+MsRbgRLdlphs
 AA2dA31nD0yQ1Au7fQyc559RhdwAZc4ADo7I/3W1rIReXf/xtQt8To/UIG0amGOmV6um
 wnZw==
X-Gm-Message-State: APjAAAUyi8nGhZzGitdg1wzzl5WZ9y70vfzDLnkuf7IGXjcRi0kW+bfk
 kGS+/miesQhBhSXhiCGJalBUmQ==
X-Google-Smtp-Source: APXvYqxQZlBgpO3dMEdt2t2yl4Yv9wDlAp1X9NBOTW01EBVplNKu8Zky0k6Y/bxwJDgXhUBoVZFCeQ==
X-Received: by 2002:a63:3e09:: with SMTP id l9mr14913362pga.328.1571071451109; 
 Mon, 14 Oct 2019 09:44:11 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id 62sm19110590pfg.164.2019.10.14.09.44.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 14 Oct 2019 09:44:10 -0700 (PDT)
Subject: Re: [PATCH v5 43/55] tests/tcg: drop test-i386-fprem from TESTS when
 not SLOW
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20191014104948.4291-1-alex.bennee@linaro.org>
 <20191014104948.4291-44-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <6ee63304-405a-e9f4-8579-f4069b4f7065@linaro.org>
Date: Mon, 14 Oct 2019 09:44:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191014104948.4291-44-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, robert.foley@futurewei.com,
 peter.puhov@futurewei.com, aaron@os.amperecomputing.com, cota@braap.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/14/19 3:49 AM, Alex Bennée wrote:
> This is a very slow running test which we only enable explicitly.
> However having it in the TESTS lists would confuse additional tests
> like the plugins test which want to run on all currently enabled
> tests.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


