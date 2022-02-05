Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F172E4AAA26
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 17:26:17 +0100 (CET)
Received: from localhost ([::1]:55394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGNtA-0002ot-IL
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 11:26:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGNra-00021v-Hi
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 11:24:38 -0500
Received: from [2607:f8b0:4864:20::42a] (port=41790
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGNrY-0004z5-Uu
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 11:24:38 -0500
Received: by mail-pf1-x42a.google.com with SMTP id i30so7819427pfk.8
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 08:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kW4+P7hPcCvf7xYKPM1E8J/636KE0LDD3WG9AIB2/js=;
 b=a1QbXkUaAbi8f9jGrH0/lND7pjuenpiOFgfdRjYRG2qArwO1sQnGMONKSHiKlM7Q2B
 uxaR4rJdLVViyQjAv5CUv07/Ms38tYQO9xEjG2qeeIzpGThnsb23vsLC6XYoFG8v6cQm
 52dxrae41/ohonsKYIY2d6MgkbvRhW8tughjxD8lcgvVCjGtM90tCeLk/swaqVM5wl0t
 8EUMQP8uoR8i1VnOLw4fKDlC3EhsrGhs6E58WHMn6Co8lXE63sj67RgZBG+naN/6kK6I
 Coib8KBsE51VvXNW3oiWNrVuWwbk5c0diiCkjlkP3sY23Il0RukMyXCDWkqY+m/mNJ2r
 v0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kW4+P7hPcCvf7xYKPM1E8J/636KE0LDD3WG9AIB2/js=;
 b=P/nWRv/pIIhnZojrvmrMJGqynZMckweWY4Y0Bcn+d265abcM8sFdOhR21gQHw7hOjX
 scefat1CKCcARgm5CamT/gyDFhKe8R0FEgXWRY2FI1ifCBBkvLWz173ALxg8mk8bKhaW
 FGkD41mQeJUSvzTWxpY1cXiQ79feP5nKQNkRLIN86c/89Ijfd7QQwEJtKCNuu9tyqROU
 PXwaP8S8pw16k+27extU4wHJckTbk3sjhO0Y/5P0yf8xMkI6mJs5NXAX+Rk3wvGLOeC7
 CfKAYQUY49u47IiCaYVmGHZdiSBZTibHRRsFJPJ5gyu7z//3lUT3nzOcjiVSDZuVPRYE
 m4Aw==
X-Gm-Message-State: AOAM530hiueQjvchaiGKODZPaUo9kI/+oeJFwdskTyjMt7ER6sxiVUiB
 8cg4WHVfiutExF3c9bp4D6alNQNnXiI=
X-Google-Smtp-Source: ABdhPJwECr6BRZwAp4p1z2PRvCqER2K8aOPyy8yac+0gjfBce6ANdOnSr/7fa6LM83MoPeI+LjPvaA==
X-Received: by 2002:a65:4d0f:: with SMTP id i15mr3482663pgt.464.1644078274605; 
 Sat, 05 Feb 2022 08:24:34 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id q1sm5300399pjd.48.2022.02.05.08.24.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 08:24:34 -0800 (PST)
Message-ID: <d6b5018c-956d-e47b-eaaa-38033a7a12dc@amsat.org>
Date: Sat, 5 Feb 2022 17:24:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v4 0/4] hw/i386: QOM-attach CPUs/SGX-EPC objects to their
 parents
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Yang Zhong <yang.zhong@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>
References: <20220205124526.500158-1-f4bug@amsat.org>
In-Reply-To: <20220205124526.500158-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 5/2/22 13:45, Philippe Mathieu-Daudé wrote:
> Trying to fix the issue reported here:
> https://lists.nongnu.org/archive/html/qemu-devel/2021-11/msg05670.html
> 
> First attach the CPUs and SGX-EPC objects to the machine.
> 
> Since v3:
> - update VIOT ACPI table (Paolo)

This now works on Debian, but fails on OpenSUSE:
https://gitlab.com/philmd/qemu/-/jobs/2058210813

Any idea what is going on?

