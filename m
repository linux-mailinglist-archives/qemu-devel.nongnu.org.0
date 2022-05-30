Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CB753831B
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 16:39:02 +0200 (CEST)
Received: from localhost ([::1]:50222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvgXr-0004M2-VG
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 10:39:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvgWM-0002yS-UZ; Mon, 30 May 2022 10:37:26 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:46598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvgWL-0001PY-DA; Mon, 30 May 2022 10:37:26 -0400
Received: by mail-pg1-x52d.google.com with SMTP id j21so10282683pga.13;
 Mon, 30 May 2022 07:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NKNow5A3ksz52FcE3MHi4f0tgVQ1FKvW0Hktqw8N9KU=;
 b=bPaivOxI+NijZDR6ALEBQrpnlH/9l8yd39n9BcNvfq1RgY4i0+QUfqRzSV1MvycgA5
 P4x0DrZfcNWyyRmul36ukRhk38OUSKAvJ/kqP/x7+pLQfO7QD2Vt83JlVRXscka7xz4Z
 jVNKXIsROhxoWGy1xqp4qRPvRdiApIcjF+KlQgU9Q0aUjk18lFFrko526i+FL2yqWL3y
 BWxYXhdPaNq92eAEAdanARpa+hbjHdRVberjrHyN5pgGzWeVPkirXbF8Vgrcp4XtWJpK
 afgQja6w9AkmE2M7/XcO2/mJNwI6eSySh8NYZGMR0ffZH+H77iWJWvnO1uS6wzy208GI
 d96w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NKNow5A3ksz52FcE3MHi4f0tgVQ1FKvW0Hktqw8N9KU=;
 b=ufqelBF2RujFiVkpgReUrj+21H9WHbMGEH0exd7HR1Eh06tyVqrTtB9OOASQVVnFBq
 Eg6n3VMfWPDNWPz02O0KeEtrLUEd24vGN0obj9ajM8KuOrDNyzHSY0LRjLtW/4+SDpdw
 hqsQt11cVgwu4bHrMFHbFi8hBgdu8lD76SPesj6kENKLRwoaEiJxegt7wl5mjNupIG2w
 fUA33QUDj6+r5vqzWtlTF17uG6dChtrJD/YJruwfSYj8/P61Libou51b+jWCpBXfRvrS
 rR+DlQiJs/JcfBYnyUe5mFAHh0CtDY7s/LOTAkz2xALX7SqQcWliRC0uTZdj5Wp4MwMc
 VocQ==
X-Gm-Message-State: AOAM530tpdwxe2GztjBlaJiOJ3qnLUG9mwer3o9yfA1zKI6QlyLyBuCY
 qkZ6ddiv1RmMrWH0HePopsU=
X-Google-Smtp-Source: ABdhPJzKkmrGgRsHpJSsZ5V0mxzmmH5mCzwyOhJwO50HEaWvGqcrEfFr2f1oCBEjjM9DCz6o1rqY2Q==
X-Received: by 2002:a63:6685:0:b0:3fb:fe7d:b5f4 with SMTP id
 a127-20020a636685000000b003fbfe7db5f4mr6597799pgc.275.1653921443836; 
 Mon, 30 May 2022 07:37:23 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a170902bd0700b001637fd08a75sm4782124pls.63.2022.05.30.07.37.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 07:37:23 -0700 (PDT)
Message-ID: <fc24ead8-4495-f67d-6fb0-c2d11bf94684@amsat.org>
Date: Mon, 30 May 2022 16:37:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH] hw/nvme: deprecate the use-intel-id compatibility
 parameter
Content-Language: en-US
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
Cc: libvir-list@redhat.com, Keith Busch <kbusch@kernel.org>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>
References: <20220429054149.2169473-1-its@irrelevant.dk>
In-Reply-To: <20220429054149.2169473-1-its@irrelevant.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 29/4/22 07:41, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Since version 5.2 commit 6eb7a071292a ("hw/block/nvme: change controller
> pci id"), the emulated NVMe controller has defaulted to a non-Intel PCI
> identifier.
> 
> Deprecate the compatibility parameter so we can get rid of it once and
> for all.
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>   docs/about/deprecated.rst | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 896e5a97abbd..450f945ac25f 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -356,6 +356,14 @@ contains native support for this feature and thus use of the option
>   ROM approach is obsolete. The native SeaBIOS support can be activated
>   by using ``-machine graphics=off``.
>   
> +``-device nvme,use-intel-id=on|off`` (since 7.1)
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +The ``nvme`` device originally used a PCI Vendor/Device Identifier combination
> +from Intel that was not properly allocated. Since version 5.2, the controller
> +has used a properly allocated identifier. Deprecate the ``use-intel-id``
> +machine compatibility parameter.
> +
>   
>   Block device options
>   ''''''''''''''''''''

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

