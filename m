Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D85896CF17
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jul 2019 15:47:29 +0200 (CEST)
Received: from localhost ([::1]:38122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ho6kp-0002Dx-VH
	for lists+qemu-devel@lfdr.de; Thu, 18 Jul 2019 09:47:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39488)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1ho6kZ-0001in-K4
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 09:47:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ho6kY-0002pR-Ci
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 09:47:11 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46185)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ho6kY-0002oE-6o
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 09:47:10 -0400
Received: by mail-wr1-f68.google.com with SMTP id z1so28746018wru.13
 for <qemu-devel@nongnu.org>; Thu, 18 Jul 2019 06:47:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VUVqJcLkdQAFwJf0ncQ8+RqxpyqcKtdhNjv6pfiCUzo=;
 b=FVKLazc/4YwxdlW5ao83Z8dZ9aq1a42WW9pGYaekHIcqMsRatF4MpjyQalIWLYDG4u
 xWba/If2BooV/xcoQfwOwxwATcINOMfzuepwJ7LQ84nI0HP7sBE3BfL9vq9MT5r/fCrm
 Egf0g+GdSOG5ozVpzd9wLwfmAbVKZgSAZGuMLwc43TarPQ1V56YBmUQ3mbeUuGiu6wrJ
 zKvrw/V2a2yyeGhJMJZ3BS/I6aAxkkQHGSWsfui/0EtmHyADdhckFmJFYiqlvIipQNBw
 nJmJYD+pFo2hu30R+px8GsgEXiIyuihVie+OXGNAAMr2fQnAGGQPps6oOkF8J9bSBDli
 i1Qg==
X-Gm-Message-State: APjAAAWQItm2QCxf2Pyi8ue0NmKjJI5V7hSXtBZ0u26bWCfssGX318xA
 fb6m7Kri8Vvh0HbGmxOw20zDng==
X-Google-Smtp-Source: APXvYqxsAMnMwSuiQorkfEDqskSnUsDirchHwJjbxgQ3Rh+vE//ztvpXuFu9akj3rnvVFezD2ZtmwQ==
X-Received: by 2002:adf:dfc4:: with SMTP id q4mr49092814wrn.54.1563457628092; 
 Thu, 18 Jul 2019 06:47:08 -0700 (PDT)
Received: from [192.168.1.37] (62.red-83-42-61.dynamicip.rima-tde.net.
 [83.42.61.62])
 by smtp.gmail.com with ESMTPSA id y12sm6836342wru.30.2019.07.18.06.47.07
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Jul 2019 06:47:07 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20190718131659.20783-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <14686032-d601-8a8a-ce41-e3537e91f4aa@redhat.com>
Date: Thu, 18 Jul 2019 15:47:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190718131659.20783-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-devel] [PATCH for-4.1] configure: Clarify URL to source
 downloads
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
Cc: Stefan Weil <sw@weilnetz.de>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/18/19 3:16 PM, Peter Maydell wrote:
> If configure detects that it's being run on a source tree which
> is missing git modules, it prints an error messages suggesting
> that the user downloads a correct source archive from the project
> website. However https://www.qemu.org/download/ is a link to a
> page with multiple tabs, with the default being the one telling
> users how to get binaries from their distro. Clarify the URL
> we print to include the #source anchor, so that the browser will
> go directly to the source-tarball instructions.
> 
> Reported-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Suggested-by: Stefan Weil <sw@weilnetz.de>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  configure | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index eb635c3b9a5..bf79bbd0e8d 100755
> --- a/configure
> +++ b/configure
> @@ -322,7 +322,7 @@ else
>          echo "to acquire QEMU source archives. Non-GIT builds are only"
>          echo "supported with source archives linked from:"
>          echo
> -        echo "  https://www.qemu.org/download/"
> +        echo "  https://www.qemu.org/download/#source"

Thanks Peter and Stefan.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>          echo
>          echo "Developers working with GIT can use scripts/archive-source.sh"
>          echo "if they need to create valid source archives."
> 

