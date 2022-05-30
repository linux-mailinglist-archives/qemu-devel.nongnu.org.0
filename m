Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A101537699
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 10:41:09 +0200 (CEST)
Received: from localhost ([::1]:43416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvaxY-000835-6k
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 04:41:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nvapF-0004s8-FW
 for qemu-devel@nongnu.org; Mon, 30 May 2022 04:32:33 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:42842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nvapD-0000h7-Vw
 for qemu-devel@nongnu.org; Mon, 30 May 2022 04:32:33 -0400
Received: by mail-ej1-x635.google.com with SMTP id q1so2857057ejz.9
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 01:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Rto31pY+bJUVMUkDN4QZn7akoy+HdezaL296EcFo3PQ=;
 b=qic5J7MQa/z2wl1HDd6WXJRZpcDgYxXtchRxsBEJGVmqfY0sj06lBxE8dWa4zNUjtP
 aJ79E+looVhqpobQVeQbHKYii9VlN9Qr/nZ/LUBXKSgf5ifpiQanoBrKt8PWwNyuzxMW
 TYPZx+18nt9cYTGb7YMWimg/GOEz8qmze3N1ckFh7VS5gIMwk+KEQT7ent+JrESNlH9l
 3RxGNLWb7SX1DdJryjxZkJlSePZTmUKRr9CP8kfnj+C4uofkpquycBICX9BXAOhd7Ha+
 1ehkxsDbtTbqhVFEqN6KMLglT1DV6kPdyL/sxtMS2tWPYfzsyyr5odKErKCeuRn3VR7A
 iaZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Rto31pY+bJUVMUkDN4QZn7akoy+HdezaL296EcFo3PQ=;
 b=dBEFkM4DNjAXnHdNfxlrAK3/pbyKDFyyAj4ps+DzHUEbWvep7GTsm9oc+CMiqJPPOo
 VN5+bKu0j9zA5UTghZYIt4xylvh7wE63uUr4PSWEz1zlaDE6QyA1jG53pK0be2iDhfvQ
 /86oshMaJ1IkrXmGBQZcA07VrQ6nHKqrNAwdIbbeK/GeXt2gOMLQqrSyE8Mgf6bTkHmV
 Wc3lc4zgcQgEh2dSkZfK3NqjPHNIOsAjAxqUuhxaRrCg2PDHvYGpQ3LKe9OqJ2J6g/uD
 Xf8tQNEGZTtW5iDFg49V0/pILAp3qIQdXpAmEAsPmii4mtLYTsw8drlJyjzkT3/l08/R
 TJuQ==
X-Gm-Message-State: AOAM531E00JM5zdmzgwvxvjOxkVmlukgdTuQpHsgrunCC+gTbCNSoByC
 nICrZKMYPg7AGPw6zWMN9Jg=
X-Google-Smtp-Source: ABdhPJxySIYCwJT8ExkZi89ZpZYcv9XtqNIx3WMSWPgzmhVYHWhclncAI9Xs0rgOwaR+VepjRQw/AQ==
X-Received: by 2002:a17:907:2998:b0:6fe:a132:5e72 with SMTP id
 eu24-20020a170907299800b006fea1325e72mr44073712ejc.320.1653899550572; 
 Mon, 30 May 2022 01:32:30 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 a92-20020a509ee5000000b0042dbc55f6e4sm3416615edf.7.2022.05.30.01.32.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 01:32:30 -0700 (PDT)
Message-ID: <c483bfdd-e953-1209-d77f-a925d6e016cf@redhat.com>
Date: Mon, 30 May 2022 10:32:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1 25/33] configure: enable cross-compilation of optionrom
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, stefanha@redhat.com, crosa@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220527153603.887929-1-alex.bennee@linaro.org>
 <20220527153603.887929-26-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220527153603.887929-26-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
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

On 5/27/22 17:35, Alex Bennée wrote:
>   
>   QEMU_GA_MSI_MINGW_BIN_PATH="$($pkg_config --variable=prefix glib-2.0)/bin"
>   
> +#######################################
> +# cross-compiled firmware targets
> +
>   # Set up build tree symlinks that point back into the source tree
>   # (these can be both files and directories).
>   # Caution: avoid adding files or directories here usin

This conflicts for the same reason.

Paolo

