Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAB665C01D
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 13:47:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCggr-0004L8-5e; Tue, 03 Jan 2023 07:46:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pCggo-0004Kj-OK
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 07:46:46 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pCggn-0005Pl-3z
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 07:46:46 -0500
Received: by mail-wr1-x430.google.com with SMTP id d4so21314526wrw.6
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 04:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mLKJ2VjAaixgoYSzDXipuEVYBfeBDiZmfjAY0ez+rio=;
 b=L4rFOdcEO31aSn04gq+92MhdhE3GGz+Q9H1j40fRb3408jzdA71KxRTmECNcUBf9vC
 o8uy2PaGetMO6pPxCzRxA+UYuBR/2q7GqRjZ4zv1mI9VQOevFLg8parS5hNtipRMRN7V
 hyym7mKXYd1tnRaWhULjnrZmVU8Msso5wXjKW16PA8ZF5m7PQKKmRLN3GJ8fpUZ+Oxic
 F6NR6LWFFUxmgKfiOQ/2xyBGqfXFU7BU0xmeRsBEMIt+2lSBaKqToftvCOqcuQ8xLxTg
 tUAmoLj7re+iniiRs4TKYI2yKyk3PbaTytuzUPFtd6ckLoxPdmCp6FlZLwo1oEeLsj+u
 NZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mLKJ2VjAaixgoYSzDXipuEVYBfeBDiZmfjAY0ez+rio=;
 b=HQe06n7z7a/rAfZK49Yv0BbKOiRON52ZgvfDGBNtP9CiBUEhEIdtlSEi9bYvggn5nF
 dr/YxZFy7k+prqtvaAaalcGiTFZjVSjunmWkR/TqMe18t9LkcTCeKmFwAqIi67U7SZ3p
 eGM0z4mqcK0SqBKFfOXXagqKwPiMMa6GR7HJ6sYUv+O124xMUAqF7WJ6YNn5yi9PVSVT
 vxWbhbeTXikSz6ZYEw4d4wUNmG5j5uUnSeeXAX1PR7HFqwpyDt83Olou5v9tz3asoUlR
 M5UkLkLmabFJ1AtCpGm0BkDUADsTrgEJtsp+AyWX5paD2399ERNDicCvdfstvv02N/TZ
 J2+Q==
X-Gm-Message-State: AFqh2kqYIIhALWHardAdkS/S7u7JNyG6HWbBdocw98Rx+OH/9Ql3wKne
 qYSAmlUmqHw0LMOjlD+77YWZnw==
X-Google-Smtp-Source: AMrXdXv14eAC/Na4EOSl58cevg24YUuLtJ0w4wBvNbTFdIlBjy88+O4QFIXlWPffJMv2rdq5U/8Zig==
X-Received: by 2002:adf:fec6:0:b0:238:3d2a:cd85 with SMTP id
 q6-20020adffec6000000b002383d2acd85mr27157145wrs.57.1672750002835; 
 Tue, 03 Jan 2023 04:46:42 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p14-20020adfe60e000000b0022584c82c80sm31252958wrm.19.2023.01.03.04.46.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jan 2023 04:46:42 -0800 (PST)
Message-ID: <c9840a0a-5544-a100-3a71-13ec90e080dd@linaro.org>
Date: Tue, 3 Jan 2023 13:46:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 00/10] Various win32 fixes & new 'get-win32-socket' QMP
 command
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Guohuai Shi <guohuai.shi@windriver.com>, Bin Meng <bin.meng@windriver.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Kfir Manor <kfir@daynix.com>,
 Guoyi Tu <tugy@chinatelecom.cn>, Yonggang Luo <luoyonggang@gmail.com>
References: <20230103110814.3726795-1-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230103110814.3726795-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.103,
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

Cc'ing more Windows specialists.

On 3/1/23 12:08, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Hi,
> 
> The following series first fixes a few tests on win32. The second part focuses
> on 'add_client' support, by limiting its scope to sockets and adding win32
> support. Finally, it enables vnc-display test on win32, to exercise the new code
> paths and demonstrate its usage.
> 
> 'get-win32-socket' can be used to write more robusts code & tests using sockets
> on Windows, and will be used by a follow up series testing dbus display support.
> 
> Marc-André Lureau (10):
>    ccid-card-emulated: fix cast warning/error
>    tests: fix path separator, use g_build_filename()
>    tests: fix test-io-channel-command on win32
>    tests/docker: fix a win32 error due to portability
>    tests/readconfig: spice doesn't support unix socket on windows yet
>    osdep: implement qemu_socketpair() for win32
>    qmp: 'add_client' actually expects sockets
>    qmp: add 'get-win32-socket'
>    libqtest: make qtest_qmp_add_client work on win32
>    qtest: enable vnc-display test on win32



