Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3435E65C001
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 13:39:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCgZL-0001Ya-Oc; Tue, 03 Jan 2023 07:39:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pCgZ1-0001V3-KW
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 07:38:43 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pCgYy-00040w-4n
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 07:38:42 -0500
Received: by mail-wr1-x434.google.com with SMTP id t15so20436104wro.9
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 04:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N0BfHbJ7SLn7gor5eQatMKlsPcWuEKBGWiLRqR7D8JU=;
 b=ANJ+75NTcgVcplOl4BG5640EFT5bAwcLuhKar8t1unlWkU9SVz9WxOBm/TcsytyFKs
 rKgs2pYzNhBz1HlWskO9Y3SCdRgMRQbdXwlmFzO5Kj/++0cnbOZclvRsuFpQtibgGrrB
 5OB4qebMSR0MtlsfDiPQ8SpKHLfDIq4Lr2UxMtDZSb/qnKTpjNDLnP3+2vcQP46foRp7
 WUnLtUpWTEFBgbNXbFP8UQtJBll+EDO31Ixi/t5FbC0l/UJTDewIU6PAMORWW1PsfLSf
 MdxrE0TkVSzxinAZmOLgoaCQsxNoPVt/2/BkbQejtyGuVx6PnTEKesAEUmt8YHWX+/v4
 mFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N0BfHbJ7SLn7gor5eQatMKlsPcWuEKBGWiLRqR7D8JU=;
 b=Q3K/wX+aLSZYkORXPNo5cfCM7DuwTYjXWLYXPlCUe+/ZHzpSBveoBKeDPyhpoS3wgq
 yVGg6cuYRU9NFuQQKN4AaDqK7DywzRA447Seew/SHXuGEsOX3OW3Kqa+/6AJnDJQPULK
 5IJoOSyWFqTgNyh/Oif/E4/4IWAk25spkS/K+Q0QTHdbbSy11RBlz/yttwVjQ4B9xphV
 DLCEQkuTNYUhHpagxGCcRmWGUeL/tFCTML6TIQBr/+s99Q3YNSrGYuvZGMSVpIoJGj92
 12LO5z4rAqWRJmPfQ0js7FjrPBy+0ytFB2tx5SSTMFYIgMnlz3en9HVMS/0m13y2xAK3
 7nKA==
X-Gm-Message-State: AFqh2krjVpcqO8GioSCMnxqJw9Nw5w632EktOr3Hv5XhvZteG43ZptLa
 5NF6uy3eFamO5woq8kWaFHgPwg==
X-Google-Smtp-Source: AMrXdXvlKNbSJ0++qDW1wr5QXwlQ+1djA9G91HET/RIV1ZmpSWk6oRNwyK8mQzpBNrAGH8IpEas2aA==
X-Received: by 2002:a05:6000:1c05:b0:261:d8be:3046 with SMTP id
 ba5-20020a0560001c0500b00261d8be3046mr29094901wrb.0.1672749516835; 
 Tue, 03 Jan 2023 04:38:36 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o15-20020a5d684f000000b00286ad197346sm18091163wrw.70.2023.01.03.04.38.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jan 2023 04:38:36 -0800 (PST)
Message-ID: <9cd0e326-21d4-6722-3408-5644fd01eb40@linaro.org>
Date: Tue, 3 Jan 2023 13:38:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 04/10] tests/docker: fix a win32 error due to portability
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20230103110814.3726795-1-marcandre.lureau@redhat.com>
 <20230103110814.3726795-5-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230103110814.3726795-5-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.103,
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

On 3/1/23 12:08, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> docker.py is run during configure, and produces an error: No module
> named 'pwd'.
> 
> Use a more portable and recommended alternative to lookup the user
> "login name".
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   tests/docker/docker.py | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


