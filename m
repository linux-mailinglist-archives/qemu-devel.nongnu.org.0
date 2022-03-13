Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD754D7597
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Mar 2022 14:55:45 +0100 (CET)
Received: from localhost ([::1]:58262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTOhE-0002b1-Jj
	for lists+qemu-devel@lfdr.de; Sun, 13 Mar 2022 09:55:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nTOeY-00018i-Kh
 for qemu-devel@nongnu.org; Sun, 13 Mar 2022 09:52:58 -0400
Received: from [2a00:1450:4864:20::435] (port=42775
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nTOeX-0007wH-7e
 for qemu-devel@nongnu.org; Sun, 13 Mar 2022 09:52:58 -0400
Received: by mail-wr1-x435.google.com with SMTP id u10so19995041wra.9
 for <qemu-devel@nongnu.org>; Sun, 13 Mar 2022 06:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BNofb4MaZ852m/U+b+LFeTpgLo7VsXCBdDYC4kRXAAY=;
 b=XMSQydBM9+6U3LxGwYlzUkcWYo16fwmy1YmAuUnFnpgHcm0UpFtdH9CU0E+fHofHLp
 PX6zPKmz4azJWli1/MEw07xCHrxPtj52GDiaNYWpIWJAB0Csvvbj3k3C6uSlx9N1EFAq
 cBtqcgsvrpBryQy1vSJ58ThZmoje8TTdMpfoSxUhxT2uV83j92O3PGYrHB5qm/OFwCqS
 D032LTaIzL7mscR3hgB8SfLHZTcPO7TKfdfnFNdOQzGvIC3C8EK8njJehXTN8bv243Z/
 E0XPEOXynxVxXh1HUMxrGo82qUWn+B4Y9yi6xEzYBFNoyKgasdPegQ38yPjXQtcD6o7j
 fQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BNofb4MaZ852m/U+b+LFeTpgLo7VsXCBdDYC4kRXAAY=;
 b=Zu7Aq9+w809yCi7LeAKl59hNRA48niBNWQ4lfb+6CYfsey6HxMcW3wU0ben0fabf95
 5TkYp+33ICCzx+3cFZDcuQtINgSsX3iSnt3s/hH5n2KqSdVa+XyIO2FQWjLYSUN3zufq
 K5Yzn3pdocE3NjjcnwBzcMsWhQI3Qp/M6BB/OVxL7NYE30ZzZDB8qDqgUII2pwxnG7Xz
 bXGMykOmSwYf3mUe+QokbqEHq3HTpBwssnRAKlHq86jYVQ9swM974PwFNSJa3T4od985
 xuZrCI+xjhjtzt1gP5WL1ppmSBR5h4E8xpSEj42sEEl754ukhSq/O3xekbJ6LhFOrkgK
 voTQ==
X-Gm-Message-State: AOAM530MPyTODcspP5AVu6D9gbbv8bLAnsJg3TGJ8nTwUffknwsKQrGr
 7LRDhqinPVATCC9qh9NttF0=
X-Google-Smtp-Source: ABdhPJwdDpD4O+swyFkHU/fSbLpulN2x9Y3zmRLA8q0E5aruftECPwPDrR8/hKxG95a8+EJeN9li/A==
X-Received: by 2002:a5d:6506:0:b0:1f1:da5e:e077 with SMTP id
 x6-20020a5d6506000000b001f1da5ee077mr13558602wru.405.1647179573052; 
 Sun, 13 Mar 2022 06:52:53 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w9-20020a5d6089000000b001f0256761b9sm17587869wrt.45.2022.03.13.06.52.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Mar 2022 06:52:52 -0700 (PDT)
Message-ID: <704d7a63-9e97-32ff-6bba-635c9b4a523f@gmail.com>
Date: Sun, 13 Mar 2022 14:52:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 09/11] edk2/docker: install python3
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20220311053759.875785-1-kraxel@redhat.com>
 <20220311053759.875785-10-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220311053759.875785-10-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/3/22 06:37, Gerd Hoffmann wrote:
> python2 is not supported any more,
> so go install python3 instead.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/edk2/Dockerfile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>



