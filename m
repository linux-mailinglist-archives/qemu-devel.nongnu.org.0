Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81434216528
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 06:21:45 +0200 (CEST)
Received: from localhost ([::1]:34322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsf72-0005i1-BQ
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 00:21:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jsf6I-00056u-4z
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 00:20:58 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:28052
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jsf6F-0003pu-Mj
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 00:20:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594095654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Zh7rmnl5N4wnRyaCh44r65qigLXyOnQ7ck7qUUOCkec=;
 b=Q/e8aq8Df38x1uoOmWv4Ik5ZQPiXaf5KOa1zQpIZbzLA8oY2lcYNkgHqFMtv8Oq0GUUts/
 5wg8eTHQrik6S6cyzqbI9xmcHuJliU+lu2pEglCtsYBqAmaWTg0qWnSxEZznxBMAnDTKgr
 O7HRdiNkNP9Ezd+L2cWFlIk2IdLvoo8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-aafLoHSkMEO3GEBbcpYOpQ-1; Tue, 07 Jul 2020 00:20:52 -0400
X-MC-Unique: aafLoHSkMEO3GEBbcpYOpQ-1
Received: by mail-wm1-f69.google.com with SMTP id e15so51110458wme.8
 for <qemu-devel@nongnu.org>; Mon, 06 Jul 2020 21:20:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Zh7rmnl5N4wnRyaCh44r65qigLXyOnQ7ck7qUUOCkec=;
 b=YtlMVu9B/2CGjIma7gq+8ZqUdYue9xKxwhAUMK84AemdESOhGI85KA7uxWyw8UnucR
 W5Hup439DJrYUVTZ7jex3niCaxSxk/H91WnpobyEWmAnKkwEhiJ5lqKQMljMcCEQAsOb
 qSQ+Skq02D1mGbFsiENqfb/JjIxgK28mdjhU6zgBX+UyGKm84eu90R5cQMdRq8cEDJTK
 pqFs3PbcaolZ5Xq8FGsIT9FCSSX3mgtoHwUrYChp0EiDsGb3rTdCq+0OyEvG8e0BBJGT
 yxALf1yeb+i1FV60/y2G4enXEFA8mNxvztt+PkvYndHQCl+1tWipkfOI7nvj/TOV9Wwq
 xWGA==
X-Gm-Message-State: AOAM531RK8DRnhEeCqXdC5fO77DZdYUuZTxbGpBzJcwDdhJ8QWRZUuKt
 uAFoCtHSxuvfGTakSg4CuHAuu7ORb8S25mpsDM8d3UmnPL8VskTGcrrysHQm8CQi/gcSjpzt0jm
 hwRSmFDvrtvz/Bdk=
X-Received: by 2002:a1c:2485:: with SMTP id k127mr2013354wmk.138.1594095651491; 
 Mon, 06 Jul 2020 21:20:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwT2nN004XxgjREDMNQlFyEspPcQA3n/b6GuuGEYk3qZf4ikeUAoxAhDBNpkZhkgujkxv95Kg==
X-Received: by 2002:a1c:2485:: with SMTP id k127mr2013339wmk.138.1594095651256; 
 Mon, 06 Jul 2020 21:20:51 -0700 (PDT)
Received: from [192.168.1.36] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id y16sm26618705wro.71.2020.07.06.21.20.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2020 21:20:50 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] tpm: tpm_spapr: Exit on TPM backend failures
To: Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-ppc@nongnu.org,
 marcandre.lureau@redhat.com
References: <20200707040522.4013885-1-stefanb@linux.vnet.ibm.com>
 <20200707040522.4013885-2-stefanb@linux.vnet.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <aa63c5f3-308e-59e1-11ff-0e0d923658e8@redhat.com>
Date: Tue, 7 Jul 2020 06:20:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200707040522.4013885-2-stefanb@linux.vnet.ibm.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 00:20:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: david@gibson.dropbear.id.au, qemu-devel@nongnu.org,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Stefan,

On 7/7/20 6:05 AM, Stefan Berger wrote:
> Exit on TPM backend failures in the same way as the TPM CRB and TIS device
> models do.

Maybe the other models are not the best examples ;)

> 
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>  hw/tpm/tpm_spapr.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/tpm/tpm_spapr.c b/hw/tpm/tpm_spapr.c
> index cb4dfd1e6a..8288ab0a15 100644
> --- a/hw/tpm/tpm_spapr.c
> +++ b/hw/tpm/tpm_spapr.c
> @@ -306,7 +306,10 @@ static void tpm_spapr_reset(SpaprVioDevice *dev)
>                              TPM_SPAPR_BUFFER_MAX);
>  
>      tpm_backend_reset(s->be_driver);
> -    tpm_spapr_do_startup_tpm(s, s->be_buffer_size);
> +
> +    if (tpm_spapr_do_startup_tpm(s, s->be_buffer_size) < 0) {

I don't see error reported, how users can know the cause of the exit?

> +        exit(1);

What about using this instead?

           qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_ERROR);

> +    }
>  }
>  
>  static enum TPMVersion tpm_spapr_get_version(TPMIf *ti)
> 


