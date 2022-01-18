Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 074834928E9
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 15:56:28 +0100 (CET)
Received: from localhost ([::1]:52908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9puM-0005em-HP
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 09:56:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9oVY-0005hM-5q
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 08:26:44 -0500
Received: from [2a00:1450:4864:20::332] (port=43871
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9oVW-0003vN-GH
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 08:26:43 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 e9-20020a05600c4e4900b0034d23cae3f0so5249849wmq.2
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 05:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sJ/R/ch8BweeIKbLxNa++aVoRYNwlIxGa1h8zxHZbV0=;
 b=Ll6tROKXo82cJSCC7hm4CuQu9pHYMsXBv7FBXBWEvSF3dbFadLLA391SE71uVD7AxK
 DZoYmvqW7rHjwLnx7S2t9GBVoWzxPJkj5MXjMgXXE6DGWiXefQnvTQylDYKI8ydGNJ6R
 6SQQGG4w0GD1Xd/eKvR0/jHBtFbsgtTv1EC6D5/gzxP7ddEi47iDOGSPYclRWrWHLU8P
 Oomwf7P1eewx5bvLs9XvH9DD/tOE5oeezUVHUmpE3vCGearLoQ5rWdRQtHkvVz1S/6h7
 OcW2EWbW1jZqN2dTZqeEZ1qYfYsW1DR+5eugHHwdQwzI563QxcTnOZ/HF1l2XLA8lEmW
 hAAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sJ/R/ch8BweeIKbLxNa++aVoRYNwlIxGa1h8zxHZbV0=;
 b=b7e4jc3SzCequE+FgY79mCeIovyuZxdsJyMFMLB4M3eEKlMyrVoYNNUK8gRNRyJMeJ
 F+yU/YXhi6ts84K80NgImBuNkVFZrgSoJbge++BxM5Mbt5A3IzD65a8nZmgs97PHXWnR
 EE3bRILrGgR0JB+KDi2gjN/4NGSXWDoVz3ZP5chFYmn0qEAsrQBE2f7Q528ThIvJo4UE
 j4Q+NhEcoL2M/80r+5NcKKhcxH0EKb8pJS3JsPvuXggR4wYMPLqCZtkqjya3zZ7W1+36
 5A4iBAreTAvIj5EL3eydfu1ANJ3c4uw2q7WuXB/cugQfEbzU9zeSBoGXs+87mSQjTYMk
 4W1w==
X-Gm-Message-State: AOAM530hDDsFJPTPM7UpZww/2VaTmlqIBoXag9ZiJdcHtfM1ND37GO5u
 O0Cjow9fkFA8goAX4H90LqU=
X-Google-Smtp-Source: ABdhPJyqFd/MrJESDhDhxtFPwLNo1ZaTrif2Vr0q7UzXwg+UE3nAPB+4h0pHqGGkfUM/RKKu6JGZqA==
X-Received: by 2002:a7b:cd13:: with SMTP id f19mr32130632wmj.13.1642512401114; 
 Tue, 18 Jan 2022 05:26:41 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id h2sm2272389wmb.12.2022.01.18.05.26.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 05:26:40 -0800 (PST)
Message-ID: <531d40b3-d155-0f6e-e732-f2e14f4b53d5@amsat.org>
Date: Tue, 18 Jan 2022 14:26:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 2/2] python: support recording QMP session to a file
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>
References: <20220118100140.252920-1-berrange@redhat.com>
 <20220118100140.252920-3-berrange@redhat.com>
In-Reply-To: <20220118100140.252920-3-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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

On 1/18/22 11:01, Daniel P. Berrangé wrote:
> When running QMP commands with very large response payloads, it is often
> not easy to spot the info you want. If we can save the response to a
> file then tools like 'grep' or 'jq' can be used to extract information.

> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  python/qemu/qmp/qmp_shell.py | 29 ++++++++++++++++++++++-------
>  python/setup.cfg             |  3 +++
>  2 files changed, 25 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

