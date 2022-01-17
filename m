Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC98490B28
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 16:08:00 +0100 (CET)
Received: from localhost ([::1]:53158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Tbz-0005S4-Mh
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 10:07:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9TYX-0001eS-86
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 10:04:25 -0500
Received: from [2a00:1450:4864:20::32e] (port=40564
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9TYV-0002nX-Co
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 10:04:24 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 25-20020a05600c231900b003497473a9c4so25037334wmo.5
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 07:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1dcmMVAKCX5BUNmrAvqZHtIczndKHfvHS4umECNoddk=;
 b=bzbP4zC7BSs0GJ87i5stccZuT9VaWtSgmFGDERROmGaic2PDuVjHsMEE8RD1ELpixY
 xkvjWCTw6r86zMt0aOvpNv2DfqFSIKbd2QwO0UTlh4oeNBcX+izAYktwfVZAF9lS7pdR
 xgwVVm8fGzRe1j/T4FvEUN8fUV2Vss65bRA+wchBcLXRgj6inKjrdQn10b4+3s83Qwl8
 Ry0KxRa4JeqkFbNNouZJ5VNKKnjWTY1+HouBQ0MC4X7evP8RxbhbgUGsxHcPoCSxLmr0
 pOCEBsbK7vMqNmIgEyGzCetf0Kyrx+6vAJSTl/fjS1C00rzzwyCUgMO7e6iJuVnpk0e3
 5Zzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1dcmMVAKCX5BUNmrAvqZHtIczndKHfvHS4umECNoddk=;
 b=q62m+I/NDBoQ5gYeeARulCEB22wKnqyciQDKXV1LvbL4o15qQyF/cAM/o1sEhBfrO3
 u8IWM7FeAXPm3cR2yrbCNyz9p9DObIVWjVEoe9qyjZvNfbTvN+fsItWkgyc3imr4o3o7
 ow4KVr62bPEXWa5BSt/qsE1ILSdL4oVIltEioxE2plIFAstjKEHIxXz9QHTYIcflIk6K
 9LVb2+NLTRnIuX3WZAUoHrAyHOfDq/TI7eL5S+1KhSIvKYPWEET7g0BHrdPv8MEzu2aJ
 iwFjikYfW1em1afQAMNwyKX4g7WExNSvexXxNTWex3YlvKXT8ra908EGTRXJ7WfjtYG/
 WWDA==
X-Gm-Message-State: AOAM532s7do5TTewuwq/NbP/P5eYvYfUHbi7AgRmTqBrbDW4dIvXG7FX
 yHc8PEYPtdy0LAzx1KcT1vM=
X-Google-Smtp-Source: ABdhPJxK1MIj2ZuxiuMb8S5FM2xkfp5bGnCgeLenJKYAhXBMx5fCoQnbkyGICHqoaKEXvSOPRsDKOA==
X-Received: by 2002:a5d:40c1:: with SMTP id b1mr19704084wrq.206.1642431861817; 
 Mon, 17 Jan 2022 07:04:21 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id r19sm13543535wmh.42.2022.01.17.07.04.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 07:04:21 -0800 (PST)
Message-ID: <d61fbcc6-48e1-d434-6488-8ebcccacb6c8@amsat.org>
Date: Mon, 17 Jan 2022 16:04:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/2] python: support recording QMP session to a file
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>
References: <20220117141103.157288-1-berrange@redhat.com>
 <20220117141103.157288-3-berrange@redhat.com>
In-Reply-To: <20220117141103.157288-3-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 1/17/22 15:11, Daniel P. Berrangé wrote:
> When running QMP commands with very large response payloads, it is often
> not easy to spot the info you want. If we can save the response to a
> file then tools like 'grep' or 'jq' can be used to extract information.

> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  python/qemu/qmp/qmp_shell.py | 27 ++++++++++++++++++++-------
>  1 file changed, 20 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

