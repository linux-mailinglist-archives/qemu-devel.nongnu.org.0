Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 711EC478948
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 11:56:58 +0100 (CET)
Received: from localhost ([::1]:41638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myAv3-0006mT-10
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 05:56:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1myAtm-0005Y8-3L; Fri, 17 Dec 2021 05:55:38 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:40097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1myAtk-0006Bg-3M; Fri, 17 Dec 2021 05:55:37 -0500
Received: from [192.168.100.1] ([82.142.30.186]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N2V8T-1mVKHS0hPr-013voY; Fri, 17 Dec 2021 11:55:25 +0100
Message-ID: <8578090e-ee93-4599-62c6-3633b81da1f3@vivier.eu>
Date: Fri, 17 Dec 2021 11:55:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 02/28] glib-compat: Introduce g_memdup2() wrapper
Content-Language: fr
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210903174510.751630-1-philmd@redhat.com>
 <20210903174510.751630-3-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20210903174510.751630-3-philmd@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:oiiNr09RsECoGk1DwZJAfE6ar7F7As2lz9hJNQN39ICtiMe5RhX
 7TW3IDdfstQDLbmA1H8J9SaqUW8NDlvw3tB8YypIwOvkgnadGwSDm00ohaxJIUBDqTtuf4e
 USTg31KaH/Kr4W0UcPX/kWkBZ6fpuXFGUkgDnjUrPJRx2d4BCSoWQQv5p95CRkVn0mclbfI
 AYh4NAsEd6DlgXDluIXYA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ldRfpqJwU0Q=:Grwe7gCXCtVwbcFj0cn73X
 uRw97Zfm8husyKEFhFb2AOmqNfeqkcmmu1XbsmS91rdkNiuwiM1bcgd1IpC5KoR+1BjQIrdTa
 UzCQAxZ/8MQtFNeup3ugOQM1mqEAkunbZbeOBoeldqYdBzZ6d34kdzk7F6oP6FtTKvNUaz2UC
 GG/mX6qNdgMyP5KS1Qn4NoHRs0DJaalgTrEP5WJhQR2USilQgPvupErzc+IyDlytmJB4vevWm
 iV2h1QDcCkdX4azMaWW9dK0uLJXZBBvR0epB1z+dzAMAER7RPZM3Np4LrQ6e80Ffz/LlLggLz
 6ocnH3X0pdMxdXUUmJt7aN+0I2cH6VXN2KlbsUPQc4WelvgJ+KDCL/lSo4PtwDCJ1Uj7RP15+
 IP1XvUibaRyB2NE5pIL0q9uxw0OII2kbR2RS031/DwH17lxKSFpFA9i4hG2h9cQ2HfGXnjZQR
 bxUyLsM9HCgmegS2u32ownbuFMxvyQp7HQSxUNGVQPpMbRMv7dRvAoIxJQpT02ClkbP75AaLJ
 +D8L2A0LQyYjwNi7RhVxGMeuw77qi6JMB31YKH8V+5PQ3WId0k5m4GaxDmk7l/1R9N5ocRTGi
 EIdOtdeOTFxsyHV3VdCUtspoqx7QVn91jfVij/WcOpmy3rTTkPLB4Jx2FwFoSn7pB9uIJVDz0
 a71aw6Ecas0Ls/ySDtcL81d+1Vic+nmoEUBfxt1lqwPKOs4Z+zUu236HcA9T2u4f1fG0=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 John Snow <jsnow@redhat.com>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 03/09/2021 à 19:44, Philippe Mathieu-Daudé a écrit :
> When experimenting raising GLIB_VERSION_MIN_REQUIRED to 2.68
> (Fedora 34 provides GLib 2.68.1) we get:
> 
>    hw/virtio/virtio-crypto.c:245:24: error: 'g_memdup' is deprecated: Use 'g_memdup2' instead [-Werror,-Wdeprecated-declarations]
>    ...
> 
> g_memdup() has been updated by g_memdup2() to fix eventual security
> issues (size argument is 32-bit and could be truncated / wrapping).
> GLib recommends to copy their static inline version of g_memdup2():
> https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538
> 
> Our glib-compat.h provides a comment explaining how to deal with
> these deprecated declarations (see commit e71e8cc0355
> "glib: enforce the minimum required version and warn about old APIs").
> 
> Following this comment suggestion, implement the g_memdup2_qemu()
> wrapper to g_memdup2(), and use the safer equivalent inlined when
> we are using pre-2.68 GLib.
> 
> Reported-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   include/glib-compat.h | 37 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 37 insertions(+)
> 
> diff --git a/include/glib-compat.h b/include/glib-compat.h
> index 9e95c888f54..8d01a8c01fb 100644
> --- a/include/glib-compat.h
> +++ b/include/glib-compat.h
> @@ -68,6 +68,43 @@
>    * without generating warnings.
>    */
>   
> +/*
> + * g_memdup2_qemu:
> + * @mem: (nullable): the memory to copy.
> + * @byte_size: the number of bytes to copy.
> + *
> + * Allocates @byte_size bytes of memory, and copies @byte_size bytes into it
> + * from @mem. If @mem is %NULL it returns %NULL.
> + *
> + * This replaces g_memdup(), which was prone to integer overflows when
> + * converting the argument from a #gsize to a #guint.
> + *
> + * This static inline version is a backport of the new public API from
> + * GLib 2.68, kept internal to GLib for backport to older stable releases.
> + * See https://gitlab.gnome.org/GNOME/glib/-/issues/2319.
> + *
> + * Returns: (nullable): a pointer to the newly-allocated copy of the memory,
> + *          or %NULL if @mem is %NULL.
> + */
> +static inline gpointer g_memdup2_qemu(gconstpointer mem, gsize byte_size)
> +{
> +#if GLIB_CHECK_VERSION(2, 68, 0)
> +    return g_memdup2(mem, byte_size);
> +#else
> +    gpointer new_mem;
> +
> +    if (mem && byte_size != 0) {
> +        new_mem = g_malloc(byte_size);
> +        memcpy(new_mem, mem, byte_size);
> +    } else {
> +        new_mem = NULL;
> +    }
> +
> +    return new_mem;
> +#endif
> +}
> +#define g_memdup2(m, s) g_memdup2_qemu(m, s)
> +
>   #if defined(G_OS_UNIX)
>   /*
>    * Note: The fallback implementation is not MT-safe, and it returns a copy of
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


