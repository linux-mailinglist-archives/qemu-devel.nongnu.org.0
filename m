Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99707185FF2
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Mar 2020 22:22:39 +0100 (CET)
Received: from localhost ([::1]:58978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDaiU-0002Gd-EY
	for lists+qemu-devel@lfdr.de; Sun, 15 Mar 2020 17:22:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47437)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDabn-0000Wi-0f
 for qemu-devel@nongnu.org; Sun, 15 Mar 2020 17:15:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDabk-0000xA-Q9
 for qemu-devel@nongnu.org; Sun, 15 Mar 2020 17:15:42 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:52898)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDabj-0000sQ-5i
 for qemu-devel@nongnu.org; Sun, 15 Mar 2020 17:15:40 -0400
Received: by mail-pj1-x1042.google.com with SMTP id ng8so85588pjb.2
 for <qemu-devel@nongnu.org>; Sun, 15 Mar 2020 14:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fGiEToJDmHZ23wWB7KN3N5rVEv/XWprEkoFFYikdSe8=;
 b=mOBYid6Nc33aUg9Uic9D4nURfIZuS5liqqLzTpwfyqsgJpCOwd1ZON1izO2tGOsFvw
 nMUaPfmNxIktZ7mem13xLSGmNrnpJbVdFZ+P3Nl32Bkm4cjPaX6UJS0e9hcCwvdJJGTt
 7dsgvcVWzf6bGufAsLUr/B33PMbVf77MLbr8o5WhrZBSyENWtshP2ONSPQVOaXRuWX5s
 aozKWajJi/ZJhdz08wbhSi8CxPzVK04kUH2xfdA8B0CuUgsVSWdwyl9CQWAzUbgj4cRr
 jDEjI+EfwnmqJa6JW2EJ/j3WTyFaGGHMUzssVFPJGgU7SBhXfE1TNMgNE3ekzvpw5bi2
 zfKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fGiEToJDmHZ23wWB7KN3N5rVEv/XWprEkoFFYikdSe8=;
 b=NyYB4BhXBCTGo1kECbph6le++ImhnPCW/eT/MJYAmSJPIdPYFBhWn5XNLlIA8PPwHs
 F2SdWZyRIICi1kbi7P48DDbYZbICAelcgoTBVusaKOjfYEa6152HDQBdMdPRaew58Wa8
 iCH8JuXsZ8N5RL9kmZXv3xrfjEFWSn06pK2xSZAMIzWuUhVkoH/kuyPKVDXD2PUheyLJ
 +SLoZebwUwtkSqOF1IYVu5rcbQf4HdpqzYnTVx3+6eaBvwx5CJ6Iy7Q3IMFUyere0eJm
 bZj/We106kZbmxfFQCmZ4/yAo7YHrjvB1q6o2vnLsU4JFu6WUOUiUWLuLbM2/PZsr0q9
 wOhw==
X-Gm-Message-State: ANhLgQ2ETEgctOUa2kpzUynqUjQ1eLn0qVDZsMBZ47FvWyPqaV7hZm07
 04DWcMeNdUCMwxB3mSlR6TSrWw==
X-Google-Smtp-Source: ADFU+vtGBhOHzvlZDDV8H+GNptvGtN2DuALeXVdl6lE48caCTErwMB1OzBoTHnkSJE6RtjY8AjgkuQ==
X-Received: by 2002:a17:90a:1f45:: with SMTP id
 y5mr21511321pjy.170.1584306937116; 
 Sun, 15 Mar 2020 14:15:37 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 z8sm11132970pjq.10.2020.03.15.14.15.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Mar 2020 14:15:36 -0700 (PDT)
Subject: Re: [PATCH 1/9] target/i386: Restrict X86CPUFeatureWord to X86 targets
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200313184153.11275-1-philmd@redhat.com>
 <20200313184153.11275-2-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b604aa7f-e189-49cf-db51-3ee2cb323844@linaro.org>
Date: Sun, 15 Mar 2020 14:15:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200313184153.11275-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1042
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Ben Warren <ben@skyportsystems.com>, Peter Lieven <pl@kamp.de>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/13/20 11:41 AM, Philippe Mathieu-Daudé wrote:
> Move out x86-specific structures from generic machine code.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  qapi/machine-target.json   | 45 ++++++++++++++++++++++++++++++++++++++
>  qapi/machine.json          | 42 -----------------------------------
>  target/i386/cpu.c          |  2 +-
>  target/i386/machine-stub.c | 22 +++++++++++++++++++
>  target/i386/Makefile.objs  |  3 ++-
>  5 files changed, 70 insertions(+), 44 deletions(-)
>  create mode 100644 target/i386/machine-stub.c

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

