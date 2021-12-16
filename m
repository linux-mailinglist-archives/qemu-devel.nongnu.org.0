Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 348C9477BB6
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 19:44:42 +0100 (CET)
Received: from localhost ([::1]:48248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxvk9-0007e6-24
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 13:44:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxvew-00066W-V4
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 13:39:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxveq-0007fs-24
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 13:39:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639679951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NfaU8TjKmM2SL5bUcLh7VXaP6O+RnGZA0udY5OpISrM=;
 b=HhbpeIHmmbbGHiTmlmfFimBKvdKbL2x3gVmMmnmSR/ULmELjo8fHvactH9/Dvnin3MYiC9
 s2vvwXcRH2788jSKAGw47YhnL78LiMv7YxboUl4VQ1HIqfHFe59iyVgFHrmGVpNx86KMNw
 gEbLZgWsIJOjRZHb1q9JKJHKwJwPlQg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-332-Q_iLGa1IMau-HWqlcegnTg-1; Thu, 16 Dec 2021 13:39:08 -0500
X-MC-Unique: Q_iLGa1IMau-HWqlcegnTg-1
Received: by mail-wr1-f70.google.com with SMTP id
 q17-20020adfcd91000000b0017bcb12ad4fso7199237wrj.12
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 10:39:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NfaU8TjKmM2SL5bUcLh7VXaP6O+RnGZA0udY5OpISrM=;
 b=XOg2g26Iuii7yLnVmNxfcSHLGFaljTbXsMSCfaN3jmLDfesnRoj0g2OeR3QzP60yJE
 aRoIjqyF1ctc/XD/SbRTpjSvExiXKlVgmJpmutu35c0jdl0bVC/dgo2yW+/2CJFDB1YT
 StQyBW+nrUco+Yy9ObR64LQUlcm0na/BgEx80h3hG1Xy3JzJg1V4VX3kkUB44Y3/yjCJ
 HnHyCbOjc07X+UXPU9gLrrXpKHoW06w9UHw50yR2Z4qEZMfyGxB9Yd9BDg1djnv2zMu+
 LS57pHkWoSuzWpmLM4ln1/0oPrBPF10bVn1RkxETFVBraRe4ESAiH6qW4ycvTKvg2wvM
 U0zQ==
X-Gm-Message-State: AOAM5309CXBdRV9WImVv6SLGrodK+acSC2uMz335fzifvdR6JphaDW13
 oeUtweXfkEQOQd2VtXR8VWVgxQ322N7x4y8GneF4+2JEV6pVieju5vPJVyuF4dFubeOdhyaZwhQ
 LP9JQzp79GHwkGhU=
X-Received: by 2002:a05:600c:4f0f:: with SMTP id
 l15mr6198341wmq.25.1639679947301; 
 Thu, 16 Dec 2021 10:39:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJytZZKNfdd/nfcJy7Mc54exkuMIcvuDW5VhVePdXrHzCpbGbRW+g+SZtYJclZMwMIbZsCF0Xw==
X-Received: by 2002:a05:600c:4f0f:: with SMTP id
 l15mr6198302wmq.25.1639679947008; 
 Thu, 16 Dec 2021 10:39:07 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id o3sm6193100wri.103.2021.12.16.10.39.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 10:39:06 -0800 (PST)
Message-ID: <34bd86db-a213-bb3a-9c72-8c48bd138835@redhat.com>
Date: Thu, 16 Dec 2021 19:39:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 02/28] glib-compat: Introduce g_memdup2() wrapper
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Eric Blake <eblake@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
 <20210903174510.751630-3-philmd@redhat.com> <875yrofxki.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <875yrofxki.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.034, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/21 15:11, Alex Bennée wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> When experimenting raising GLIB_VERSION_MIN_REQUIRED to 2.68
>> (Fedora 34 provides GLib 2.68.1) we get:
>>
>>   hw/virtio/virtio-crypto.c:245:24: error: 'g_memdup' is deprecated: Use 'g_memdup2' instead [-Werror,-Wdeprecated-declarations]
>>   ...
>>
>> g_memdup() has been updated by g_memdup2() to fix eventual security
>> issues (size argument is 32-bit and could be truncated / wrapping).
>> GLib recommends to copy their static inline version of g_memdup2():
>> https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538
>>
>> Our glib-compat.h provides a comment explaining how to deal with
>> these deprecated declarations (see commit e71e8cc0355
>> "glib: enforce the minimum required version and warn about old APIs").
>>
>> Following this comment suggestion, implement the g_memdup2_qemu()
>> wrapper to g_memdup2(), and use the safer equivalent inlined when
>> we are using pre-2.68 GLib.
>>
>> Reported-by: Eric Blake <eblake@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  include/glib-compat.h | 37 +++++++++++++++++++++++++++++++++++++
>>  1 file changed, 37 insertions(+)
>>
>> diff --git a/include/glib-compat.h b/include/glib-compat.h
>> index 9e95c888f54..8d01a8c01fb 100644
>> --- a/include/glib-compat.h
>> +++ b/include/glib-compat.h
>> @@ -68,6 +68,43 @@
>>   * without generating warnings.
>>   */
>>  
>> +/*
>> + * g_memdup2_qemu:
>> + * @mem: (nullable): the memory to copy.
>> + * @byte_size: the number of bytes to copy.
>> + *
>> + * Allocates @byte_size bytes of memory, and copies @byte_size bytes into it
>> + * from @mem. If @mem is %NULL it returns %NULL.
>> + *
>> + * This replaces g_memdup(), which was prone to integer overflows when
>> + * converting the argument from a #gsize to a #guint.
>> + *
>> + * This static inline version is a backport of the new public API from
>> + * GLib 2.68, kept internal to GLib for backport to older stable releases.
>> + * See https://gitlab.gnome.org/GNOME/glib/-/issues/2319.
>> + *
>> + * Returns: (nullable): a pointer to the newly-allocated copy of the memory,
>> + *          or %NULL if @mem is %NULL.
>> + */
>> +static inline gpointer g_memdup2_qemu(gconstpointer mem, gsize byte_size)
>> +{
>> +#if GLIB_CHECK_VERSION(2, 68, 0)
>> +    return g_memdup2(mem, byte_size);
>> +#else
>> +    gpointer new_mem;
>> +
>> +    if (mem && byte_size != 0) {
>> +        new_mem = g_malloc(byte_size);
>> +        memcpy(new_mem, mem, byte_size);
>> +    } else {
>> +        new_mem = NULL;
>> +    }
>> +
>> +    return new_mem;
>> +#endif
>> +}
>> +#define g_memdup2(m, s) g_memdup2_qemu(m, s)
>> +
> 
> As per our style wouldn't it make sense to just call it qemu_memdup(m,
> s)?

I followed the documentation in include/glib-compat.h:

/*
 * Note that because of the GLIB_VERSION_MAX_ALLOWED constant above,
allowing
 * use of functions from newer GLib via this compat header needs a little
 * trickery to prevent warnings being emitted.
 *
 * Consider a function from newer glib-X.Y that we want to use
 *
 *    int g_foo(const char *wibble)
 *
 * We must define a static inline function with the same signature that does
 * what we need, but with a "_qemu" suffix e.g.
 *
 * static inline void g_foo_qemu(const char *wibble)
 * {
 *     #if GLIB_CHECK_VERSION(X, Y, 0)
 *        g_foo(wibble)
 *     #else
 *        g_something_equivalent_in_older_glib(wibble);
 *     #endif
 * }
 *
 * The #pragma at the top of this file turns off -Wdeprecated-declarations,
 * ensuring this wrapper function impl doesn't trigger the compiler warning
 * about using too new glib APIs. Finally we can do
 *
 *   #define g_foo(a) g_foo_qemu(a)
 *
 * So now the code elsewhere in QEMU, which *does* have the
 * -Wdeprecated-declarations warning active, can call g_foo(...) as normal,
 * without generating warnings.
 */

which is how g_unix_get_passwd_entry_qemu() is implemented.

Should we reword the documentation first?


