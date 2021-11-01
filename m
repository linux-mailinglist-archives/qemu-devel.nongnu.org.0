Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D11E0442266
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 22:10:20 +0100 (CET)
Received: from localhost ([::1]:50326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mheZP-0003Oy-3d
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 17:10:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhdNx-0002Ff-GT
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 15:54:25 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:42866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhdNv-0001AL-FH
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 15:54:25 -0400
Received: by mail-wr1-x42d.google.com with SMTP id v17so29664208wrv.9
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 12:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PeKYsIccSvhNNWd8XbRSJ7zyEjJsIYv4wrEpaacG4/M=;
 b=YUZB2qJVcrbXC5VdztvVrRQuBpVNY1nyyEYdUITE4Vz4NMSUGV1mb5qDs2zk3rqaZ6
 f0w55WhVjV5Kr3jddoppIPxZnlFdT9KCtyCyzGRZianjcSvf7vhKGaY5hikLKJnbu8jX
 j+18dg4f3n+PwKNi70lsZNFeQrRH4lRr5uL9xmoZ76vLSh4T48gT4lzfyHeVSJ62UybW
 8vpZfkMcyYN+fr7KgWsnD8WbNzh3IBZ4XOCPbMPDNrjdfNqG1HzfeqR6mqi2+lVhVELi
 gF+W0AChyTmepYFBXDw6sFKwi61tFvOzBnqo72dGA2rmOcwd2MOlGRVMlSLj7MTbicRE
 Murg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PeKYsIccSvhNNWd8XbRSJ7zyEjJsIYv4wrEpaacG4/M=;
 b=UKzPBIZkX/BEak8orKh0lzt4OF1CZdmy3xJdl+pDaSp1ct7DY61MhlPJ1ptvOcq9V+
 1yw0Lvhx2omZDjqDXupNUXgV4BDzEgUpl72M2GOy0mdxM5dYYMhD3UbX1bBOHqmscSkS
 Snhuoha74uWThjFFgnjWFHN/8OD+nCtjnU3kVc32fwnE29liE6d8M5ci0OEwEIqIbcDO
 yL89J50X/KGSxUNX7gIQwstt/GTmdBcG4fbg2Dtg8f+IQw5/sPRs0TX9J3vnKHg9/UT6
 yqgivv9I8dHkG74p6l0rhM9RaFdoGyLcKUk5DmGQkL5uXjgBCpPLaomzLcJL9sq+SnHH
 F4PQ==
X-Gm-Message-State: AOAM531/jFnGz+Y40ISf4yDWeyQPXzGF/KhyoiNfb4S+iKHXXjuyW3EG
 g5eoXSXyCWLFZChQ/7VMjT4=
X-Google-Smtp-Source: ABdhPJxOLrtgiYSS0hP2wA0YLpjzXJqIW6oS5+2uikPELJdYpZldXT0Zbr9i0msi9SxXd8XHaPvmrg==
X-Received: by 2002:a05:6000:15c6:: with SMTP id
 y6mr40975970wry.210.1635796461672; 
 Mon, 01 Nov 2021 12:54:21 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id m21sm9685493wrb.2.2021.11.01.12.54.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 12:54:21 -0700 (PDT)
Message-ID: <bd623d82-78a7-8f06-d0b7-ad6d832f8b5d@amsat.org>
Date: Mon, 1 Nov 2021 20:54:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/2] qtest/am53c974-test: add test for cancelling
 in-flight requests
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, pbonzini@redhat.com,
 fam@euphon.net, thuth@redhat.com, lvivier@redhat.com, qemu-devel@nongnu.org
References: <20211101183516.8455-1-mark.cave-ayland@ilande.co.uk>
 <20211101183516.8455-3-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211101183516.8455-3-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.14,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/1/21 19:35, Mark Cave-Ayland wrote:
> Based upon the qtest reproducer posted to Gitlab issue #663 at
> https://gitlab.com/qemu-project/qemu/-/issues/663.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  tests/qtest/am53c974-test.c | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

