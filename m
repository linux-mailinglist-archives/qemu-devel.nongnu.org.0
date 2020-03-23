Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1040318FCA5
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Mar 2020 19:24:33 +0100 (CET)
Received: from localhost ([::1]:38198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGRkW-0001aN-3t
	for lists+qemu-devel@lfdr.de; Mon, 23 Mar 2020 14:24:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60953)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jGRhh-0007GR-FC
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 14:21:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jGRhg-0001K7-CW
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 14:21:37 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:44700)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jGRhg-0001Js-6t
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 14:21:36 -0400
Received: by mail-pf1-x441.google.com with SMTP id b72so7879078pfb.11
 for <qemu-devel@nongnu.org>; Mon, 23 Mar 2020 11:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RJ3t11+kp/TkFaY/RJ2OKzRAY0NUHdLClHKhhgv/Fds=;
 b=VvEclW9WOKAOMGM3kWf4dcj0Gl1mkPyygrvoxiqCmB6nq+B+PeIoSQSoTtOpk3CKtT
 sD1iDJrrxZhk4FU6KbOVHVIud1SSVqVJ34FrtT8u9lghjuyzzz7s94VFXEZUwJ82VMPK
 vRWdgPsK6oCp08JvVucfZm0+WQ902wIDaNJjTD7KT4ZWZ9/q8Wjn12vyaXvEyq5sF3qK
 IOFkGE0jy/P363U8lK2Roiz3H51JMMYHHIJC2VmeEX+uWfRYvaAmc292Hq4PhrUJhXmu
 fDAclO+nbhjCLTjYywIocQcWPaq7UqCCcKRNa/IX+75GymPEJ6ZY7qqA5lCkGCinaGOh
 +qKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RJ3t11+kp/TkFaY/RJ2OKzRAY0NUHdLClHKhhgv/Fds=;
 b=hlsGr3upco5Lkg7UxaIxYJoqVXEIYJXrM3K8lZlWhYUA9n95pcBhcp/Oz3FtxLHW+x
 KRnQs7ra/6uAYsLwRch2qhyjC6KfJ+smyDjtP7jwWX0cZ1AmfCE3SdVKbZq0NyJCrpvI
 zpq+GhfnsTGv4LAyIgsubHu9U6PjKHbH/De68b/0KBSSu81y13JxYu2FXjr20YgEm2Jm
 gBR9SrW8X2g2IyHWw8z9UgsmtwfICb3SrD0g1sTEdx1iZ04tquDp3wkqbicE72+thwg3
 TjRJl5haQWteRO1agwYkz6O7GGWcNsVvCtPLPzxZ5xidhuMfY0TsS8oszScdo6sUyNtS
 MKDw==
X-Gm-Message-State: ANhLgQ0+B8KJQujyBho2jB15OxY2btjIbqomQVDWMDXJRARe4BlvjpF6
 B6/s4SUm0FdMpF7xRHTI4EJV1A==
X-Google-Smtp-Source: ADFU+vvLnXYEtyFKGN4w3O/zvHJ9qauGjrOumkpm0ep4tQOhTa1yADOAKdF+Cy371g9eSiV5cEVzVQ==
X-Received: by 2002:a63:c811:: with SMTP id z17mr22765037pgg.41.1584987695068; 
 Mon, 23 Mar 2020 11:21:35 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 d7sm13880070pfa.106.2020.03.23.11.21.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Mar 2020 11:21:34 -0700 (PDT)
Subject: Re: [PATCH v1 11/11] .travis.yml: Add a KVM-only s390x job
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20200323161514.23952-1-alex.bennee@linaro.org>
 <20200323161514.23952-12-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9b24bb99-0bf3-2884-4ade-278901a1dcdb@linaro.org>
Date: Mon, 23 Mar 2020 11:21:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200323161514.23952-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
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
Cc: Fam Zheng <fam@euphon.net>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/20 9:15 AM, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Add a job to build QEMU on s390x with TCG disabled, so
> this configuration won't bitrot over time.
> 
> This job is quick, running check-unit: Ran for 5 min 30 sec
> https://travis-ci.org/github/philmd/qemu/jobs/665456423
> 
> Acked-by: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20200322154015.25358-1-philmd@redhat.com>
> ---
>  .travis.yml | 42 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


