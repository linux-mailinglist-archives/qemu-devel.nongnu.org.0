Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E874E5418
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 15:15:55 +0100 (CET)
Received: from localhost ([::1]:57188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX1mE-0001kZ-Hn
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 10:15:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nX1aA-0000T8-HV; Wed, 23 Mar 2022 10:03:26 -0400
Received: from [2607:f8b0:4864:20::22e] (port=45739
 helo=mail-oi1-x22e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nX1a9-00024q-0G; Wed, 23 Mar 2022 10:03:26 -0400
Received: by mail-oi1-x22e.google.com with SMTP id 12so1687384oix.12;
 Wed, 23 Mar 2022 07:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SFm2Fw/VRXh0ZqidqoBDjNUQxn8+tTLn3712PX2pTMc=;
 b=RvUy81dNrks/mAoGRKfWVx6YMoMldFd0RCEr4lvSEVxVj77JvawZu10wBaiKUPn9XL
 jp55LQWAjvRbtMNx+AV+OcrE1OWjp5qMDavoNlh49Mk92HjbAjSW+faPYyfPZuqfV6AU
 0vufZ8UOklWVpg7ESXsXBlWXrdt7dlGutTjmwmGXM+GDPcvmzAYQbHu+VK7ooYEjWau5
 tsUxqJpXb4AI4pxvAl4UDLHHJCx6I0lIvpXSoagYNpMeEW1mvzJnWabckr4M5XbLPNSy
 nhBNlUYCRMEU8RAU/HJOIgdo+8yV1E6iGJVr2UcB8kfN96aL3gzJGZZoBX9ToeTJepJc
 wUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SFm2Fw/VRXh0ZqidqoBDjNUQxn8+tTLn3712PX2pTMc=;
 b=zCs6RO7V4InI/RLUdLQTirxTfvfLSKuimaeUQULQaZkas5jgJfgbLGdohL5xZfvoE+
 hrK2gPqwoFCwFJTsIcgd15xBQR+nIwKRjSPHacK+BZYvJ6sKJPszOh7NY0/b+DTQm1Hv
 JcpY5AylS+DqPSCAbeyx2ddDiw2XwhO2yRDsTzWaiK1VueSO2PnZzkDViWddOJv/sw3Q
 IHQ5ujfrNSysx8pctQ/wgoF35MhP0vbmxi64VS19cPLlUWO+WMypKajrGgA9tjIqMx5j
 l0P0pKM/JJ/qrNPmxTcmiIdEH85tt7aDKg1eUFF/iwmHzdeIUMBOkjoekQIYjyQWGlkc
 xwTg==
X-Gm-Message-State: AOAM531idvlul1MAB4zNjcI97D8wCLHFUVXWIxy4ROFhJCylUtdKgeDf
 te+be2N7KgFKvooxf4TVkDe4+dRkmVYZfp/eiDQ1ol5H3GQ=
X-Google-Smtp-Source: ABdhPJyXO5STFrmJbyBSzVSTdhEuAbzNUstgYbEhS0JkdYveQU8ay7mUTotKmG1fuj8zWWs7BHk/+eUe5j4VcvWjVx4=
X-Received: by 2002:aca:ead4:0:b0:2ec:ba66:12df with SMTP id
 i203-20020acaead4000000b002ecba6612dfmr5012367oih.194.1648044203040; Wed, 23
 Mar 2022 07:03:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220323135722.1623-1-dmiller423@gmail.com>
 <20220323135722.1623-10-dmiller423@gmail.com>
In-Reply-To: <20220323135722.1623-10-dmiller423@gmail.com>
From: David Miller <dmiller423@gmail.com>
Date: Wed, 23 Mar 2022 10:03:07 -0400
Message-ID: <CAEgyohWY5822AB1AzArYypf+rDyYh5UB-0n0eWoQGOR3PhpaCg@mail.gmail.com>
Subject: Re: [PATCH v5 09/11] target/s390x: add S390_FEAT_VECTOR_ENH2 to qemu
 CPU model
To: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=dmiller423@gmail.com; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 cohuck@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 farman@linux.ibm.com, pasic@linux.ibm.com,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I am sending v5 now as I'm away from my desk until Sunday.
As I'm unsure whether or not this just needs a V7_0 and the patch
shown as an example isn't a direct correlation : I've left it out for
now.
I will dig into it further Monday March 28th.

Thanks
- David Miller

On Wed, Mar 23, 2022 at 9:57 AM David Miller <dmiller423@gmail.com> wrote:
>
> Signed-off-by: David Miller <dmiller423@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/s390x/gen-features.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
> index 22846121c4..499a3b10a8 100644
> --- a/target/s390x/gen-features.c
> +++ b/target/s390x/gen-features.c
> @@ -740,7 +740,9 @@ static uint16_t qemu_V6_2[] = {
>
>  static uint16_t qemu_LATEST[] = {
>      S390_FEAT_MISC_INSTRUCTION_EXT3,
> +    S390_FEAT_VECTOR_ENH2,
>  };
> +
>  /* add all new definitions before this point */
>  static uint16_t qemu_MAX[] = {
>      /* generates a dependency warning, leave it out for now */
> --
> 2.34.1
>

