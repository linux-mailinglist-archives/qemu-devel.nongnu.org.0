Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DDA1983A4
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Mar 2020 20:47:52 +0200 (CEST)
Received: from localhost ([::1]:55022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jIzRv-0007VI-Gj
	for lists+qemu-devel@lfdr.de; Mon, 30 Mar 2020 14:47:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47974)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <rth7680@gmail.com>) id 1jIzQd-00074C-Ip
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 14:46:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rth7680@gmail.com>) id 1jIzQc-0004P0-IB
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 14:46:31 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:34080)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <rth7680@gmail.com>) id 1jIzQc-0004OU-CF
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 14:46:30 -0400
Received: by mail-pg1-x542.google.com with SMTP id l14so1962233pgb.1
 for <qemu-devel@nongnu.org>; Mon, 30 Mar 2020 11:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Dgoj/1C6ezBnpg+bEP61EukyZYEN17LY5ZV3mLqcag4=;
 b=Oc1lQwAHqt/icHcKmVUv7+Nb2ett3WQdoVE813DBrcTBNO+HfteLfQnR6XHKr+IImP
 JqU+wIkfUJXLd8Zc0gtHIWh9UKO8cRQOeX4KjZbB15IjKGA8ifNTzxXejIrd4bE3QPph
 ox1uDxevpUVftUIb6SMJquenlThpbIdDHGNPsEvwKm2lnJz8Zw3WR5HaLNo1DWAxsYTi
 ++UVW/hSvXXYxYQy2lquJCyWIZwJs4m3WKJ8TBfYURSZ0rrTycRNaZLlmFQAz4a0lBIr
 2c092Jss/ld067NvI6F6KoUGcP8fu/ED+JTFLy3dwYYfXucVsn38e0MygMTvzmtOFe18
 +lnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Dgoj/1C6ezBnpg+bEP61EukyZYEN17LY5ZV3mLqcag4=;
 b=s/RiH080ksCn3OzUb2EV1nlXwaeYpFPxS6iioF91QtYkfVrCO8DswiLRd6E5wX4PwG
 Udz3o4C8IXQaWsyM/tJjsX8FNrTr6mRKJrOOzbfjZMuKxu+9JxlTpxHdZNex0XtuE6ep
 DpT01/KS+wVQIIkExAcYf6EHb/Us+wmkUoWzNDJnzWhoraZjNrwfXRY6wkLeY3RUoD2Z
 QkT2lILi7IUih9VAp6yAZs1pvEPtp41o/zYqc5Xcuh/o6gJ1KDe8UtJWBDRAfDWQ3n2a
 lpbU66Tz07WnACMhGpopHDlMh0GcVgO3Pja0MpNGl+rzy2kQD+lO4KHjzTJuzffJU5tV
 IIZw==
X-Gm-Message-State: ANhLgQ37YCNc/fxuAFXXptWn470HGb9PbjUaUBacp1HwBBbZCJpznLF7
 ZRgu3U7EDr7YuOgh2RrgNhs0YWU0
X-Google-Smtp-Source: ADFU+vuahVzr98C8KB1tqcvNIC6s1rxiBDuaISbfzqAAZqD8U6eEX/9FiGbCFZGY0KhzblE46Wgd3A==
X-Received: by 2002:a63:a65:: with SMTP id z37mr13633500pgk.31.1585593989310; 
 Mon, 30 Mar 2020 11:46:29 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.googlemail.com with ESMTPSA id c2sm10068550pgi.65.2020.03.30.11.46.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2020 11:46:25 -0700 (PDT)
Subject: Re: [PATCH-for-5.0?] decodetree: Use Python3 floor division operator
From: Richard Henderson <rth@twiddle.net>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200330121345.14665-1-f4bug@amsat.org>
 <ed9ac5c8-0654-3c74-3e35-5d7b02a548b6@twiddle.net>
Autocrypt: addr=rth@twiddle.net; prefer-encrypt=mutual; keydata=
 mQENBFGuLC8BCADcAoWcnW9lTsDMzbO3MBU+KbiGaj5JPatEUscRDkQYM2fyNjJp2tIWDK5a
 n4yngeXB3eX61WbYR3QraRK8mlYLGxyAdHMEQfPipbqf3TmN043fssT2bc82ApJcs1zvLYgI
 rhMht7Dck7A0wNC1jo+ZjVVFig5gDTN7gOzaAdBtV8tVNUddwkLzzaGpfihhSD6U46NdqKOG
 Wlnn6TrkMy0QGdQ5NaXHkRlUjnnUTSW/nKfoxD+EI+A9V4sYOd8mc/TL4aJh/i/AiU57eLbo
 n17uQI6/VTWDUWl8USiz4x9c8vmqlywLx00tAFxxoRWqk4KVJlj+Sh0up/D/sJ+vPpgBABEB
 AAG0I1JpY2hhcmQgSGVuZGVyc29uIDxydGhAdHdpZGRsZS5uZXQ+iQFYBBMBAgBCAhsDBgsJ
 CAcDAgYVCAIJCgsEFgIDAQIeAQIXgAIZARYhBJyxjdr46EmtKvwWpK0ScMxN0CebBQJdweUY
 BQkP1h/pAAoJEK0ScMxN0CebqDsH/0YyfnXk+Dc++H37VCEKgRet2i1ATFzxRnifkvmdxha0
 V+PVptQ2fwSe+w3KxoFecD8W75nysmUjrU/FicW9yU5YRlGONPZjruG02/KzmhA5PzWJdYO3
 i/t0qRayvWIcX2qA/flsXEbmb/BbAFM05LQIdcOu74eiBFe5CBCOWBDJeneE1urIE0hSYxoh
 nCcG60ULrNj13ohZ4zAEluoY32qIo7/OPWmtR88cPrEbZT8k+RqgZbsotzaPT1/RlL74fL8k
 ofYfTgKAFH7eEy6fF2nzDp2GThVn+3sA62xtpSXUf/X1m75B40KOcq1EQbHypNTmBc1wt13e
 ibhPNEVX2am5AQ0EUa4sLwEIALITHfH3gciRNfQIe7awDTDvn6H3C6gDyCAnv5LiuLTLZiyK
 NZp3lNO3rPowyKrGT2RIDlumlqPgdeHzqEEX91YK0yk2vdFvwU04rJ4D+qRgdUPoeICLD1zo
 PwOv2FaY6Tf8dKYas1RHF5QU5yQNey8j7IYYoE2yGPn2PtBmvtmK4iLataUEvx0U385Zr+jf
 HscqwTiToryeDC8Io/9BsMvAssE5Yf5URS2nJ7LFOvc4njsQJPF1i9egBXaIloqv7p2hVCKJ
 Hl5UWIxitQ9QQIl6iU4LCpz8mVYTXwv48IAVpbUf7+ak9V9Kk3jCeQnlxCJBUHjUhoIzinbS
 JHPHtkkAEQEAAYkBPAQYAQIAJgIbDBYhBJyxjdr46EmtKvwWpK0ScMxN0CebBQJdweVIBQkP
 1iAZAAoJEK0ScMxN0CebGHUH/RtouOlWl6To97tQsTJUq/2YwmRpFOsvV0/zCX4fKBGAbeZi
 VaELSt2+3UEErA+n8HwbQmjJ6IrdhA9GustOpOyCcbLVSMwql/OlAwBtDzCcC8dTU4zcuY2a
 rGG2A8i5krU85G9r1wowVcWZBsdmW7/dKiNoadLQiig4bHNiSaV4ograas5efyEjqTxiY+yG
 hzPw5DK2kbp2co8iDF1vW0LWPeLFBinCgItcI9LvgHWaB3rwjOfvNpMn5m64SoQYHB8wbnid
 erAjOzkBzmqnfS1tAUr8mtESStEwrEmNv0ZoA6S0Wt+c9pyTr+BpG4OFlhj7ZI+Eh7zOrr33
 q9OBIdA=
Message-ID: <18ac6d57-049e-4b45-0c9e-27190d832b50@twiddle.net>
Date: Mon, 30 Mar 2020 11:46:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <ed9ac5c8-0654-3c74-3e35-5d7b02a548b6@twiddle.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/30/20 10:14 AM, Richard Henderson wrote:
> On 3/30/20 5:13 AM, Philippe Mathieu-Daudé wrote:
>> This script started using Python2, where the 'classic' division
>> operator returns the floor result. In commit 3d004a371 we started
>> to use Python3, where the division operator returns the float
>> result ('true division').
>> To keep the same behavior, use the 'floor division' operator "//"
>> which returns the floor result.
>>
>> Fixes: 3d004a371
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> We didn't notice it because only the RX port (which uses the
>> --varinsnwidth option, and got merged very recently) triggers
>> these problems.
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  scripts/decodetree.py | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Queued to tcg-next for 5.0.


r~


