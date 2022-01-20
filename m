Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE15495515
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 20:55:32 +0100 (CET)
Received: from localhost ([::1]:38236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAdWt-0000SX-Q4
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 14:55:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nAXTE-0006JR-No
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 08:27:21 -0500
Received: from [2a00:1450:4864:20::335] (port=38581
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nAXT2-0002MW-RT
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 08:27:15 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 ay14-20020a05600c1e0e00b0034d7bef1b5dso15226736wmb.3
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 05:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zvoz0QZ04Z5COl4vC/R4z4RZN0Oc2Grh2vaZ98u9Hu0=;
 b=U8KIxlmUN7kZCOOoAff82rZL5A5Vk7fpHC5DBInH/078Mfq1xXvUrqv3goWSiQtNR3
 bmTM3OxzK9JZXP3mIFqjr2HfuCh45YxCK5qiyiWpDCfcmYxNDF+5oG3ANNIIYKvXdwdZ
 Ej4XZ7O9mmzFkbrGEjo/iiVkB13criKtlhfmcDqc4Zco+K04mF97nadaPqWD12m4Y/tI
 STHfjrmUqZGPVlRURDZZoALf3/erucCu0SZbFfJeBzwlIwSlLOyZqFsdi9apLWRusxml
 P1qKUBag28IWOMEhrJyGy24jYEykVE5sWS00rMfjG1yHegAxKZIHgb2x+fR9qwfPC3mV
 +rnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zvoz0QZ04Z5COl4vC/R4z4RZN0Oc2Grh2vaZ98u9Hu0=;
 b=TbAVdGr5N94l9bO4NZ6k2+gRy6T5E1jAlABiGMACDztp639SJGlp72zaZKZkcAcFKd
 nR+JpJly6FyTLtfhkDB2kH0e83As6TMmWHTYRfp2g9hhmrJyHQexq97vzxVsk3mk3kxa
 8uwyyZwCaWDUfZjp2HhC1VFSEj9glff8pfMvqsEi9im//5e1raY5RfhlpVLGjWupyea1
 phTmiotHYRFTXi91IU05ywlsZdYLfiU4yQjx4Ue6RcSe7C04p3xLbYNsVnosCUcpcvNo
 /uXJ+LKdESqqzk1Kk31HM2IqVT60yET0SloAn6fmqDHlareIF3bvYNF8RBD6oy97H+IF
 BbgQ==
X-Gm-Message-State: AOAM532VW8dYqG+G+WWSzmYU7dfHmBbVCymdjkh0ehsrtaXxzgICIbRG
 h3tDUYMSyYmPqyohz1u2PY8=
X-Google-Smtp-Source: ABdhPJwYvQLu9CLQcH42HMOXf++ML/bZfV8axuFOhn6QYKNeh7onLLA8t9asYoz4bdw7m9DYKo3DCw==
X-Received: by 2002:a5d:438a:: with SMTP id i10mr35123227wrq.270.1642685221978; 
 Thu, 20 Jan 2022 05:27:01 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id x4sm3037145wrp.13.2022.01.20.05.27.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 05:27:01 -0800 (PST)
Message-ID: <6714a8f5-ce68-e081-4ae6-08bce0a12c95@redhat.com>
Date: Thu, 20 Jan 2022 14:27:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v5 01/18] configure, meson: override C compiler for cmake
Content-Language: en-US
To: Jagannathan Raman <jag.raman@oracle.com>, qemu-devel@nongnu.org
References: <cover.1642626515.git.jag.raman@oracle.com>
 <139b14d9db775e4fc8755f9974c0b5d593a14d3b.1642626515.git.jag.raman@oracle.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <139b14d9db775e4fc8755f9974c0b5d593a14d3b.1642626515.git.jag.raman@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, f4bug@amsat.org, quintela@redhat.com,
 marcandre.lureau@gmail.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/19/22 22:41, Jagannathan Raman wrote:
> The compiler path that cmake gets from meson is corrupted. It results in
> the following error:
> | -- The C compiler identification is unknown
> | CMake Error at CMakeLists.txt:35 (project):
> | The CMAKE_C_COMPILER:
> | /opt/rh/devtoolset-9/root/bin/cc;-m64;-mcx16
> | is not a full path to an existing compiler tool.
> 
> Explicitly specify the C compiler for cmake to avoid this error
> 
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>

This should not be needed anymore, as the bug in Meson has been fixed.

Paolo

>   configure | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/configure b/configure
> index e1a31fb332..6a865f8713 100755
> --- a/configure
> +++ b/configure
> @@ -3747,6 +3747,8 @@ if test "$skip_meson" = no; then
>     echo "cpp_args = [$(meson_quote $CXXFLAGS $EXTRA_CXXFLAGS)]" >> $cross
>     echo "c_link_args = [$(meson_quote $CFLAGS $LDFLAGS $EXTRA_CFLAGS $EXTRA_LDFLAGS)]" >> $cross
>     echo "cpp_link_args = [$(meson_quote $CXXFLAGS $LDFLAGS $EXTRA_CXXFLAGS $EXTRA_LDFLAGS)]" >> $cross
> +  echo "[cmake]" >> $cross
> +  echo "CMAKE_C_COMPILER = [$(meson_quote $cc $CPU_CFLAGS)]" >> $cross
>     echo "[binaries]" >> $cross
>     echo "c = [$(meson_quote $cc $CPU_CFLAGS)]" >> $cross
>     test -n "$cxx" && echo "cpp = [$(meson_quote $cxx $CPU_CFLAGS)]" >> $cross


