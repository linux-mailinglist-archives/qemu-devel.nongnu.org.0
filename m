Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D328834BD09
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 17:47:11 +0200 (CEST)
Received: from localhost ([::1]:59138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQXd8-0007sJ-Rr
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 11:47:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQXaq-0006dr-Qr
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 11:44:48 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:35742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQXao-0003CN-Qo
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 11:44:48 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 v24-20020a9d69d80000b02901b9aec33371so9948247oto.2
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 08:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=24TrfHMl5m1feC+Ag1BPpc7GKjZ1d9kcUJdaBbQMfso=;
 b=bIbUy+vsN5vk1czzoAvRxIbhORWjTissx9/j/mO0gH+IucVOkZYhIh+fiNuLTRTn4I
 4y75k7frzM9F+FCR1IEuJEO1rXMlqsTOxGwtRmk4JutGMI3AvKjcrDwqRSC9Pm81ZT/u
 qGq3ETtqNK0CLTDzC01ZY6fHsgXHJ9PIin1spn/jzB8e2Yg+rGLP/5JCoaf79slrzRq8
 WuFRc8ntgKtIDb3s6RO7dssODylfoSDwIIvv64qb+mKxh1lnwXabon6zYg/gIP9OkYHK
 U+I8R01NfvsU+IWdNT4NTt1sM2pUpp0p9sYKjd/6+zg1xZx7WhZPFZ/Lu11q4voH0SNH
 HLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=24TrfHMl5m1feC+Ag1BPpc7GKjZ1d9kcUJdaBbQMfso=;
 b=hrN8+d0eJ/0kVIZVOYn419BdYogbhei7zZZSDbgPkctBTnzCelqz+MxfxmimQFB8Ar
 Qa+w1DZZUxTxTIa5Ck33euYdix7q0ss7gt2Jj9eu7ofTEG9OLZMMbFyXtsAOxBRIKmOs
 HUZVSDSwgWevcw8x0SbBiek7zWeXEBrDSVUPa6y47c7X1ZtiTiVuk62pLRNtKaqADRr3
 XQRR4gUrU/uSe1/U0nQFH18NXeyZdi8WLMLvMQsWloy4sALgFWP5iXl1SvyV+ZGFQoUo
 pZk6jAVEFqCXa8KoYYNbJVI615T3nffxCXhLX/hDKghZ0oWcEnPcgxmc68ckOU4qWyiy
 o+YA==
X-Gm-Message-State: AOAM5307MPVEVrHMVGTAQ/t5/aAVYKe+taVqTPD05ZR4QKLr65vtcBvM
 QfCD4I57/OoYD53v0CKhvXydVHSWQ/OOKiK/
X-Google-Smtp-Source: ABdhPJwIZMrHcd0uo/fZa0RPZwBRWKPrmnqameY6cKzsMhQ+/XFl9XtwGuN/etcAEPdPJAT6rFax4w==
X-Received: by 2002:a05:6830:619:: with SMTP id
 w25mr19544543oti.371.1616946285632; 
 Sun, 28 Mar 2021 08:44:45 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id 64sm3215680oob.12.2021.03.28.08.44.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 08:44:45 -0700 (PDT)
Subject: Re: [RFC v12 11/65] target/arm: tcg: fix comment style before move to
 cpu-mmu
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-12-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <582fa23c-fcf9-2300-7ce3-9b93304f9e56@linaro.org>
Date: Sun, 28 Mar 2021 09:44:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-12-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 1:36 PM, Claudio Fontana wrote:
> before exporting some functionality from helper.c into a new module,
> fix the comment style of those functions.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   target/arm/tcg/helper.c | 152 ++++++++++++++++++++++++++--------------
>   1 file changed, 101 insertions(+), 51 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

