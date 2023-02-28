Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C696A58B0
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 12:55:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWyZu-0006H6-LP; Tue, 28 Feb 2023 06:55:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWyZg-0006ED-6n
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 06:55:16 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWyZe-0000mB-81
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 06:55:15 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 o11-20020a05600c4fcb00b003eb33ea29a8so5180355wmq.1
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 03:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IWDV0voPLdjSoxMratg5IFm9JEg45iChyCwGiFkNcqA=;
 b=Gc0cR8G9gX/q8IRHtcgAQoJBMhDelPYFwx+YZFw8svqGZ/0NJ6cr6CdifR++Wb/e4K
 OeffGswJbiq2qMdVdKHQF6i1Daab5AsdDiiSncUF1VLuTAYzi2/NyBDhAYGE0V74a7JB
 ArPcxcxjjx7OMtm27eVAqZRcy+GUvpVYYgWW4fI4mE9bHs2/NYdIWrea9h2lpK26630Q
 /3NbiW8MFB0yDgjzg9PjdseWH8uUcs0MNivDKhejgYLFi2PPpSVvkkKzJSiOeq7IRoKD
 ra71mZgr1UnS2ZlFIiSbVO6MFWxWJE+s33EjBR2ejUeCkUwTMXpIk3r7NHay67y77+/9
 SPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IWDV0voPLdjSoxMratg5IFm9JEg45iChyCwGiFkNcqA=;
 b=wOKGjzLIvf6ieBqmWmdg/r3HkYjNQKbjCLcUJnUa+FCEfCIkFgUDrIv496thko503f
 YyYg4M531WFeTn+mYw0AuBaYO67Cb4b4Qx8b4uUQgUsJnXo3aLf+IHc6VUj1d7Gzf7LG
 OlmGn9MUPziDFJtsvpoJbMV+T2zOE7HbVXZ2CxqbvENfZTAdjPMzC9I5mfX5vOsQS+U4
 w59ojmgqHUR4P3uzQY2Xq4T1dW664+wwcoi+DxiviKDx3M0CsLkTZsDcuuIMjWZFc8uG
 qOZM6KO5Yn/L64I18o96c6m9pbQtEm2EQVJTfn6EMAIK43zAc8k5RwjQYlUF/yMbQfpV
 ipbA==
X-Gm-Message-State: AO0yUKXCZt0JCKIrJEWc/2Kmis4I69uyOPANFn/4poivY6lWU9MwHhSq
 eMAWfnkko1cXAb7vg3gSOQUqtg==
X-Google-Smtp-Source: AK7set+iHpaU9/SDwMytt4cNRQ7P2nYrrnDLhWN0aLOrEfncnN1tpMElKmubcm7VxbECIIbMbRh76Q==
X-Received: by 2002:a05:600c:450f:b0:3ea:d620:570a with SMTP id
 t15-20020a05600c450f00b003ead620570amr1978546wmo.38.1677585312635; 
 Tue, 28 Feb 2023 03:55:12 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 13-20020a05600c020d00b003dc1d668866sm15777747wmi.10.2023.02.28.03.55.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 03:55:11 -0800 (PST)
Message-ID: <1abd1c0a-4c9c-35e2-6f64-cc396b1a1856@linaro.org>
Date: Tue, 28 Feb 2023 12:55:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 5/7] tests/docker: use direct RUNC call to build containers
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Li-Wen Hsu <lwhsu@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Beraldo Leal <bleal@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Ed Maste <emaste@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 John Snow <jsnow@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Hanna Reitz <hreitz@redhat.com>, Bandan Das <bsd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Darren Kenny
 <darren.kenny@oracle.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
References: <20230224180857.1050220-1-alex.bennee@linaro.org>
 <20230224180857.1050220-6-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230224180857.1050220-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

On 24/2/23 19:08, Alex Bennée wrote:
> We don't really need stuff from docker.py to do the build as we have
> everything we need with a direct call. We do rely on the dockerfiles
> being able to tweak the UID/name mapping as the last step.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/docker/Makefile.include | 22 +++++++++++++---------
>   1 file changed, 13 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


