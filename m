Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF6E3ED2D9
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 13:03:52 +0200 (CEST)
Received: from localhost ([::1]:37336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFaPH-0004pw-AZ
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 07:03:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFaOP-000490-Fz
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 07:02:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFaOL-0001sF-AL
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 07:02:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629111772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gV7peWRPRBF+yC8fWVyVayA1OMho4W3kqGxtBmF6o04=;
 b=QeheWGTbQ+yxLCImiOu2Ou05otVAFh+UilU1M6fJtztG8lMZvTBqEKqwQuLvM5QLU3EPgl
 Q4d4UR01TeSZ37GRGq07CG5XU+pM/SsZmUVr5N5G6G+SComYQLWXBZve4LujMMRtpNodR/
 sw57ZwcIanFVHfkvPCYnHl+8iUaTkMk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-BS9OCEBINcKjuH1cCH9PQA-1; Mon, 16 Aug 2021 07:02:50 -0400
X-MC-Unique: BS9OCEBINcKjuH1cCH9PQA-1
Received: by mail-wr1-f70.google.com with SMTP id
 q19-20020adfbb93000000b00156a96f5178so2013460wrg.11
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 04:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gV7peWRPRBF+yC8fWVyVayA1OMho4W3kqGxtBmF6o04=;
 b=P5n9D4VWrYVdTtApss2HhZPVj5gkIzYVsJXZnAOlx3XErlz7iqSZ07QeoI2Ap3xQKx
 EgkUnbAyJ8aCdQiJFYUGMxYlrekBvIOs+PNVaVBFa8SDpAQ9YAY1sJmpUZoTwNcRnGMR
 +8UuBhCzsNgXIXXzkfRqNzBsnH1R0rcnEAFISCUTHPOOMhOVLzD3kwyqs5h7gzlyertx
 /xH4szCE/k7MI703ZLRdIe7ZRz/FAneaYbLWbbAlsie7EDXa1JQo9gsS7CcCqwMyZFKe
 fdfYxLjsUlDqBBhPGm0Nkfm8lRCgbyMesHSI28I35vhZHIwvng9+GOYjkoKLnTlOSh5H
 fLig==
X-Gm-Message-State: AOAM530tEe7eR+VtVL9qeOxSbRgri7O2Av+FPhMftbQo+Q/sYyCfYTyn
 pW3iNk/WaupvVR9aYyAo7MvknSt6MIPDP0a8aPnxLs8Y5S4E7JMOGQGbIc7+RYC/Zkj6WFrRjix
 Qz71H/EeLN77xQQk=
X-Received: by 2002:a1c:e904:: with SMTP id q4mr14784231wmc.26.1629111769735; 
 Mon, 16 Aug 2021 04:02:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5OLLljY3SJQq1M8YqgLv8zGuR//MlWwwiQd79WVkzxgGEKohdzCYE2vlRcVtUpnZ/jWSCfA==
X-Received: by 2002:a1c:e904:: with SMTP id q4mr14784212wmc.26.1629111769574; 
 Mon, 16 Aug 2021 04:02:49 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id n16sm11213175wru.79.2021.08.16.04.02.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 04:02:48 -0700 (PDT)
Subject: Re: [PATCH 1/2] docs: split the CI docs into two files
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210812180403.4129067-1-berrange@redhat.com>
 <20210812180403.4129067-2-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3fbb77bf-c9e3-36c9-1bd0-a399f9e9fdc8@redhat.com>
Date: Mon, 16 Aug 2021 13:02:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210812180403.4129067-2-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.71, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/12/21 8:04 PM, Daniel P. Berrangé wrote:
> This splits the CI docs into one file talking about job setup and usage
> and another file describing provisioning of custom runners.

Thanks.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  docs/devel/ci-jobs.rst    |  40 ++++++++++
>  docs/devel/ci-runners.rst | 117 ++++++++++++++++++++++++++++
>  docs/devel/ci.rst         | 159 +-------------------------------------
>  3 files changed, 159 insertions(+), 157 deletions(-)
>  create mode 100644 docs/devel/ci-jobs.rst
>  create mode 100644 docs/devel/ci-runners.rst


