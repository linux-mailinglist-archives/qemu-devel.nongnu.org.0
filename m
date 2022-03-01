Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E44CA4C7F17
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 01:20:01 +0100 (CET)
Received: from localhost ([::1]:40740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOqFF-0001uv-13
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 19:20:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOqAd-0006Wi-77
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 19:15:19 -0500
Received: from [2a00:1450:4864:20::32b] (port=40575
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOqAb-0005O6-1X
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 19:15:14 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 c18-20020a7bc852000000b003806ce86c6dso355839wml.5
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 16:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WaH85arFQPiiVZkKECp8IroqqxXvRwwy1H7CScGxH0M=;
 b=h3pZmCqBNJzzA/sZhyqfcP+SCBooCARfPwpAY4od2OLm5tuF6CEJ/RJ+T0OA5/7F4U
 NpC6lcG1WmLEK7Y75Ui8pvuIl7DrtzmptMumEsj59MRL2gSxwYKqp96wwLnL68wV8ngg
 3c8kypn03Q/EtB9VVFTteIBw6rYGDcPt2yF6iH88q1NopK/O1N3qCRrxUlPL1scXB4f0
 w+uuZWbvxz3LPfxJB46FcIrT4wPgi+8SSaRFkK76/8vnHnVWKUmY367iyqeoyOqFIeRY
 fqUnMe2XYo1TMvjwD1O+H9EW2GGyg1U2uq06im4nTN3kS59rjR6fY9sFmhQL592awFjV
 7kBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WaH85arFQPiiVZkKECp8IroqqxXvRwwy1H7CScGxH0M=;
 b=gTINKI2FcKkChQC3Md1bUCY5SFkGhaEyTuIPG9jE5iyaK34CMBdN4JNL/B68/6wqy3
 AyeenADWePWBjgeQyID2Opy07wYX0rAbycgOY75aiinWnVOxf3Aj2h4czx2x54eee6Td
 zKrVCraejK40YJbNiZxKVx5byMn5jmbQqLW1u/yCvzEw+E9vvn/I85BJlyqqudU+I6V9
 jSKFQHH4PKoplwIqOUWOj5yl5O+xnZKs9yr2oK7ZIzi6EiQCF7/hl7TxDvircbczW2S3
 u8fLCh5muD9jqK7kV3JhU1RgPj8Hp+VYW6M/pAWc4UPp8MX4670rqUfjWEgAcZARYmJ3
 uBhA==
X-Gm-Message-State: AOAM5321TzWg/znEenF9DAjr39PgoOHUZRR4DfkSsBuoyBQ9ReoBBOWH
 sZSJU91uE8PoJplcRcqpc4U=
X-Google-Smtp-Source: ABdhPJz6X0LgoPXC8wd+eo62V3hgRuLBxsDQeT52FYbG7q5exY40x868nMv4Bm/qYNIcHhFRxJ1MCA==
X-Received: by 2002:a05:600c:42d6:b0:380:ed47:43e8 with SMTP id
 j22-20020a05600c42d600b00380ed4743e8mr15036684wme.61.1646093710730; 
 Mon, 28 Feb 2022 16:15:10 -0800 (PST)
Received: from [192.168.131.175] (62.red-95-127-166.staticip.rima-tde.net.
 [95.127.166.62]) by smtp.gmail.com with ESMTPSA id
 y7-20020adff147000000b001dbd1b9812fsm16769657wro.45.2022.02.28.16.15.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 16:15:10 -0800 (PST)
Message-ID: <cfcb3f54-09b2-2cdd-6f00-5710567a28f7@gmail.com>
Date: Tue, 1 Mar 2022 01:00:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2] coreaudio: Notify error in coreaudio_init_out
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>
References: <20220226115953.60335-1-akihiko.odaki@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220226115953.60335-1-akihiko.odaki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/2/22 12:59, Akihiko Odaki wrote:
> Otherwise, the audio subsystem tries to use the voice and
> eventually aborts due to the maximum number of samples in the
> buffer is not set.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>   audio/coreaudio.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

