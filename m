Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAF94E3AE0
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 09:41:42 +0100 (CET)
Received: from localhost ([::1]:51550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWa5F-0007Ox-GN
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 04:41:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nWa11-00054h-KS
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 04:37:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nWa0z-0004JI-RH
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 04:37:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647938237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RaFNCyfBD6kh0qli7J+tyQy8LRuLtHjXIEXM3Ii8P1k=;
 b=U1WzyYpagBifIMt3iB1M/hqItQTOeeEcHqKuaIn09cF78/nyC+LJhj3vW+3WBG18O1ebO7
 lI/Jg2TKG/bdGvb/aZQax2Rt45TzYKPu6TExXz5ACy3gsialyPzvGJhh6rX31Bpkr9FkMX
 hdoAG/rE9lPU6JUXhgimu4BO6vL2KBQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-13-1zpWgPebMwG-rhH0H7Eprw-1; Tue, 22 Mar 2022 04:37:15 -0400
X-MC-Unique: 1zpWgPebMwG-rhH0H7Eprw-1
Received: by mail-wm1-f70.google.com with SMTP id
 l1-20020a1c2501000000b00389c7b9254cso666766wml.1
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 01:37:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=RaFNCyfBD6kh0qli7J+tyQy8LRuLtHjXIEXM3Ii8P1k=;
 b=aNNg4YX4DcFRFaZiloNxAAKsNZjk0jxOcg5El5JifYHY2gHT44yhM/bpZhxV6r8CFQ
 qdtjR0t+mYLft30qGNDA0FplwJa0vONFtTInP9QsVkKNjKNKWZmNSxPRyRLQA19HESF5
 MWUpVEycrYYT82aNx0w+/ivqeXVfVNb/EmLVcKTD3Jvgs1esIxAabaYCEfJ7PsDWGamA
 sTekMzO2KOiLQeAP7iJTTs293sCSooPAzJwhfZprd0DAyq7PDkKYGxpERKdwiNhmaqcj
 0856Q+gxaFPBhHHjO/4lrvNHsCxPciVGEZlBbu58OXG8uZUBp7qBlw5L8i/0pL9QedKY
 00aQ==
X-Gm-Message-State: AOAM530lYnaAv13q40LzF4bVTmzdi8TbH8wRw5vA+4X0/i9lutIul5Zy
 xPZ23X7DQ/HIXAlVE4Ug1zd1raI5g7LjYXC3zORt5h+SreQqTUDdWdTN3Ya0hyuaoNyC94RaKu2
 jhR9QHFp2tlAz1m8=
X-Received: by 2002:a05:6000:15c1:b0:204:7e75:1eb1 with SMTP id
 y1-20020a05600015c100b002047e751eb1mr2007811wry.482.1647938234769; 
 Tue, 22 Mar 2022 01:37:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwM0O+5/HrPk2D2p3y01bEe2R9QWY++av9TZHh14ftBl84ARsGL/1vrICq/ZjfbneQ0JiWkxQ==
X-Received: by 2002:a05:6000:15c1:b0:204:7e75:1eb1 with SMTP id
 y1-20020a05600015c100b002047e751eb1mr2007789wry.482.1647938234514; 
 Tue, 22 Mar 2022 01:37:14 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:de00:549e:e4e4:98df:ff72?
 (p200300cbc708de00549ee4e498dfff72.dip0.t-ipconnect.de.
 [2003:cb:c708:de00:549e:e4e4:98df:ff72])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a5d5406000000b001f049726044sm15030746wrv.79.2022.03.22.01.37.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 01:37:14 -0700 (PDT)
Message-ID: <943cb709-4b89-8e53-fd5e-8ecc375d6d47@redhat.com>
Date: Tue, 22 Mar 2022 09:37:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v4 07/11] target/s390x: vxeh2: vector {load, store} byte
 reversed elements
To: David Miller <dmiller423@gmail.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20220322000441.26495-1-dmiller423@gmail.com>
 <20220322000441.26495-8-dmiller423@gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220322000441.26495-8-dmiller423@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org,
 farman@linux.ibm.com, pasic@linux.ibm.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[...]
>  
> +static DisasJumpType op_vlbr(DisasContext *s, DisasOps *o)
> +{
> +    const uint8_t es = get_field(s, m3);
> +    TCGv_i64 t0, t1;
> +
> +    if (es < ES_16 || es > ES_128) {
> +        gen_program_exception(s, PGM_SPECIFICATION);
> +        return DISAS_NORETURN;
> +    }
> +
> +    t0 = tcg_temp_new_i64();
> +    t1 = tcg_temp_new_i64();
> +
> +
> +    if (es == ES_128) {
> +        tcg_gen_qemu_ld_i64(t1, o->addr1, get_mem_index(s), MO_LEUQ);
> +        gen_addi_and_wrap_i64(s, o->addr1, o->addr1, 8);
> +        tcg_gen_qemu_ld_i64(t0, o->addr1, get_mem_index(s), MO_LEUQ);
> +        goto write;
> +    }
> +
> +    /* Begin with byte reversed doublewords... */
> +    tcg_gen_qemu_ld_i64(t0, o->addr1, get_mem_index(s), MO_LEUQ);
> +    gen_addi_and_wrap_i64(s, o->addr1, o->addr1, 8);
> +    tcg_gen_qemu_ld_i64(t1, o->addr1, get_mem_index(s), MO_LEUQ);
> +
> +    /*
> +     * For 16 and 32-bit elements, the doubleword bswap also reversed
> +     * the order of the elements.  Perform a larger order swap to put
> +     * them back into place.  For the 128-bit "element", finish the
> +     * bswap by swapping the doublewords.

Drop the 128-bit part of the comment.

> +     */
> +    switch (es) {
> +    case ES_16:
> +        tcg_gen_hswap_i64(t0, t0);
> +        tcg_gen_hswap_i64(t1, t1);
> +        break;
> +    case ES_32:
> +        tcg_gen_wswap_i64(t0, t0);
> +        tcg_gen_wswap_i64(t1, t1);
> +        break;
> +    case ES_64:
> +    case ES_128:

Drop the ES_128 case.

> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +write:
> +    write_vec_element_i64(t0, get_field(s, v1), 0, ES_64);
> +    write_vec_element_i64(t1, get_field(s, v1), 1, ES_64);
> +
> +    tcg_temp_free(t0);
> +    tcg_temp_free(t1);
> +    return DISAS_NEXT;
> +}
> +
>  static DisasJumpType op_vle(DisasContext *s, DisasOps *o)
>  {
>      const uint8_t es = s->insn->data;
> @@ -998,6 +1055,64 @@ static DisasJumpType op_vst(DisasContext *s, DisasOps *o)
>      return DISAS_NEXT;
>  }
>  
> +static DisasJumpType op_vstbr(DisasContext *s, DisasOps *o)
> +{
> +    const uint8_t es = get_field(s, m3);
> +    TCGv_i64 t0, t1;
> +
> +    if (es < ES_16 || es > ES_128) {
> +        gen_program_exception(s, PGM_SPECIFICATION);
> +        return DISAS_NORETURN;
> +    }
> +
> +    /* Probe write access before actually modifying memory */
> +    gen_helper_probe_write_access(cpu_env, o->addr1, tcg_constant_i64(16));
> +
> +    t0 = tcg_temp_new_i64();
> +    t1 = tcg_temp_new_i64();
> +
> +
> +    if (es == ES_128) {
> +        read_vec_element_i64(t1, get_field(s, v1), 0, ES_64);
> +        read_vec_element_i64(t0, get_field(s, v1), 1, ES_64);
> +        goto write;
> +    }
> +
> +    read_vec_element_i64(t0, get_field(s, v1), 0, ES_64);
> +    read_vec_element_i64(t1, get_field(s, v1), 1, ES_64);
> +
> +    /*
> +     * For 16 and 32-bit elements, the doubleword bswap below will
> +     * reverse the order of the elements.  Perform a larger order
> +     * swap to put them back into place.  For the 128-bit "element",
> +     * finish the bswap by swapping the doublewords.

Dito.

> +     */
> +    switch (es) {
> +    case MO_16:
> +        tcg_gen_hswap_i64(t0, t0);
> +        tcg_gen_hswap_i64(t1, t1);
> +        break;
> +    case MO_32:
> +        tcg_gen_wswap_i64(t0, t0);
> +        tcg_gen_wswap_i64(t1, t1);
> +        break;
> +    case MO_64:
> +    case MO_128:

Dito.

> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +write:
> +    tcg_gen_qemu_st_i64(t0, o->addr1, get_mem_index(s), MO_LEUQ);
> +    gen_addi_and_wrap_i64(s, o->addr1, o->addr1, 8);
> +    tcg_gen_qemu_st_i64(t1, o->addr1, get_mem_index(s), MO_LEUQ);
> +
> +    tcg_temp_free(t0);
> +    tcg_temp_free(t1);
> +    return DISAS_NEXT;
> +}
> +
>  static DisasJumpType op_vste(DisasContext *s, DisasOps *o)
>  {
>      const uint8_t es = s->insn->data;

With that,

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


