Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C4D547086
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 02:31:36 +0200 (CEST)
Received: from localhost ([::1]:44842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzp2M-0002Rv-Jo
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 20:31:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzp0U-0001Va-PY
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 20:29:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzp0R-00061Q-Ea
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 20:29:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654907373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bi3Jhi2WULRue/bbJ5DD2ObbRSH9n9g4eSRyENQ+guE=;
 b=ESIAB7KrIpyMzp6PqdnDa1AQzPN8BTRpXbymBtQZ5BnPvjzGbsKAsLv28C2zr+axRW/VSy
 IuNrOFnKcd3E5sZ8CiUClP3p5mZxC3QD5KwV4Ihpw4EGyn25EJlyPBqjwsDFg/xPWLFNuB
 i0C+xKuD35ZDxzkCTjikEl7wGUJ7y2U=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-216-5rpXcAdkO7Gv7pO9Ft3Gaw-1; Fri, 10 Jun 2022 20:29:32 -0400
X-MC-Unique: 5rpXcAdkO7Gv7pO9Ft3Gaw-1
Received: by mail-ej1-f71.google.com with SMTP id
 v13-20020a170906b00d00b006f51e289f7cso200652ejy.19
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 17:29:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=bi3Jhi2WULRue/bbJ5DD2ObbRSH9n9g4eSRyENQ+guE=;
 b=tQ+3rpv+k5HZSDnDJTS7KSLb7RMZ/+NmbZ0NGFRFC7BBaIelRvzYK4iH2QqU+xN9Tv
 Qk9/QCoKc2GVVL8Cyu7uoLzKu7TUAu062qM+RObfxgJXDWGl5ppH/Qgfz+pHxL3sRq9v
 +x2qWmGKnH2BlaO03iINnBL0Doh/DpKTtfomOcyPC1RkO+oYJJowLc//BWkN/PagY6lM
 tYoz2kPqXNlqLr6HJUPJmGUVHzFMg8sKvGwJPnTO1MlwjTpa7iagd+6DHc6PFvNwrV6f
 AsF2Cm6VbGWQ/dzbcEY6WSa7kk3pouqA/N/s6KwwY5DYMXaBaNJl5r8vtmAjYST7lnjM
 QDsQ==
X-Gm-Message-State: AOAM530n0nnHkjujkmTAq/IGOMs007rEu6K4p+QrhRBhldVBigywoCao
 0irXONm8KXmXg1IZAWtVH2zzjt0Nxi5iKA2KeszAd7/j8m47sZ5a23vQUpI8CBGzDk58xzfNTZX
 rhYLEu650d3/8Fgw=
X-Received: by 2002:a05:6402:190b:b0:431:3231:fce6 with SMTP id
 e11-20020a056402190b00b004313231fce6mr39420256edz.127.1654907371130; 
 Fri, 10 Jun 2022 17:29:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8jSBFhvMm38wdllfFIVMzc2Z9NhZ9OH80sgAsPOIKF+oZGeOghEJJcXFgDoHGbM7i1LRgeA==
X-Received: by 2002:a05:6402:190b:b0:431:3231:fce6 with SMTP id
 e11-20020a056402190b00b004313231fce6mr39420234edz.127.1654907370897; 
 Fri, 10 Jun 2022 17:29:30 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 cm20-20020a0564020c9400b004316f94ec4esm395195edb.66.2022.06.10.17.29.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 17:29:30 -0700 (PDT)
Date: Fri, 10 Jun 2022 20:29:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 zhenwei pi <pizhenwei@bytedance.com>, Gonglei <arei.gonglei@huawei.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PULL 54/54] crypto: Introduce RSA algorithm
Message-ID: <20220610202815-mutt-send-email-mst@kernel.org>
References: <20220610075631.367501-1-mst@redhat.com>
 <20220610075631.367501-55-mst@redhat.com>
 <93d111a8-222e-b46f-2f36-1d1784cf0373@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <93d111a8-222e-b46f-2f36-1d1784cf0373@amsat.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 10, 2022 at 05:55:16PM +0200, Philippe Mathieu-Daudé wrote:
> On 10/6/22 09:59, Michael S. Tsirkin wrote:
> > From: zhenwei pi <pizhenwei@bytedance.com>
> > 
> > There are two parts in this patch:
> > 1, support akcipher service by cryptodev-builtin driver
> > 2, virtio-crypto driver supports akcipher service
> > 
> > In principle, we should separate this into two patches, to avoid
> > compiling error, merge them into one.
> > 
> > Then virtio-crypto gets request from guest side, and forwards the
> > request to builtin driver to handle it.
> > 
> > Test with a guest linux:
> > 1, The self-test framework of crypto layer works fine in guest kernel
> > 2, Test with Linux guest(with asym support), the following script
> > test(note that pkey_XXX is supported only in a newer version of keyutils):
> >    - both public key & private key
> >    - create/close session
> >    - encrypt/decrypt/sign/verify basic driver operation
> >    - also test with kernel crypto layer(pkey add/query)
> > 
> > All the cases work fine.
> > 
> > Run script in guest:
> > rm -rf *.der *.pem *.pfx
> > modprobe pkcs8_key_parser # if CONFIG_PKCS8_PRIVATE_KEY_PARSER=m
> > rm -rf /tmp/data
> > dd if=/dev/random of=/tmp/data count=1 bs=20
> > 
> > openssl req -nodes -x509 -newkey rsa:2048 -keyout key.pem -out cert.pem -subj "/C=CN/ST=BJ/L=HD/O=qemu/OU=dev/CN=qemu/emailAddress=qemu@qemu.org"
> > openssl pkcs8 -in key.pem -topk8 -nocrypt -outform DER -out key.der
> > openssl x509 -in cert.pem -inform PEM -outform DER -out cert.der
> > 
> > PRIV_KEY_ID=`cat key.der | keyctl padd asymmetric test_priv_key @s`
> > echo "priv key id = "$PRIV_KEY_ID
> > PUB_KEY_ID=`cat cert.der | keyctl padd asymmetric test_pub_key @s`
> > echo "pub key id = "$PUB_KEY_ID
> > 
> > keyctl pkey_query $PRIV_KEY_ID 0
> > keyctl pkey_query $PUB_KEY_ID 0
> > 
> > echo "Enc with priv key..."
> > keyctl pkey_encrypt $PRIV_KEY_ID 0 /tmp/data enc=pkcs1 >/tmp/enc.priv
> > echo "Dec with pub key..."
> > keyctl pkey_decrypt $PRIV_KEY_ID 0 /tmp/enc.priv enc=pkcs1 >/tmp/dec
> > cmp /tmp/data /tmp/dec
> > 
> > echo "Sign with priv key..."
> > keyctl pkey_sign $PRIV_KEY_ID 0 /tmp/data enc=pkcs1 hash=sha1 > /tmp/sig
> > echo "Verify with pub key..."
> > keyctl pkey_verify $PRIV_KEY_ID 0 /tmp/data /tmp/sig enc=pkcs1 hash=sha1
> > 
> > echo "Enc with pub key..."
> > keyctl pkey_encrypt $PUB_KEY_ID 0 /tmp/data enc=pkcs1 >/tmp/enc.pub
> > echo "Dec with priv key..."
> > keyctl pkey_decrypt $PRIV_KEY_ID 0 /tmp/enc.pub enc=pkcs1 >/tmp/dec
> > cmp /tmp/data /tmp/dec
> > 
> > echo "Verify with pub key..."
> > keyctl pkey_verify $PUB_KEY_ID 0 /tmp/data /tmp/sig enc=pkcs1 hash=sha1
> > 
> > Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> > Signed-off-by: lei he <helei.sig11@bytedance.com
> > Message-Id: <20220527084734.2649594-2-pizhenwei@bytedance.com>
> > Reviewed-by: Gonglei <arei.gonglei@huawei.com>
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >   include/hw/virtio/virtio-crypto.h |   5 +-
> >   include/sysemu/cryptodev.h        |  83 ++++++--
> >   backends/cryptodev-builtin.c      | 274 +++++++++++++++++++++----
> >   backends/cryptodev-vhost-user.c   |  34 +++-
> >   backends/cryptodev.c              |  32 ++-
> >   hw/virtio/virtio-crypto.c         | 319 ++++++++++++++++++++++++------
> >   6 files changed, 605 insertions(+), 142 deletions(-)
> 
> > +static int cryptodev_builtin_set_rsa_options(
> > +                    int virtio_padding_algo,
> > +                    int virtio_hash_algo,
> > +                    QCryptoAkCipherOptionsRSA *opt,
> > +                    Error **errp)
> > +{
> > +    if (virtio_padding_algo == VIRTIO_CRYPTO_RSA_PKCS1_PADDING) {
> > +        opt->padding_alg = QCRYPTO_RSA_PADDING_ALG_PKCS1;
> > +        opt->hash_alg =
> > +            cryptodev_builtin_get_rsa_hash_algo(virtio_hash_algo, errp);
> > +        if (opt->hash_alg < 0) {
> > +            return -1;
> > +        }
> > +        return 0;
> > +    }
> > +
> > +    if (virtio_padding_algo == VIRTIO_CRYPTO_RSA_RAW_PADDING) {
> > +        opt->padding_alg = QCRYPTO_RSA_PADDING_ALG_RAW;
> > +        return 0;
> > +    }
> > +
> > +    error_setg(errp, "Unsupported rsa padding algo: %d", virtio_padding_algo);
> > +    return -1;
> > +}
> 
> Build failure:
> 
> ../backends/cryptodev-builtin.c:187:27: error: result of comparison of
> unsigned enum expression < 0 is always false
> [-Werror,-Wtautological-unsigned-enum-zero-compare]
>         if (opt->hash_alg < 0) {
>             ~~~~~~~~~~~~~ ^ ~


I dropped this patch now. New tag:
06cb5c82ebf5fd0f7b3c3de24d650e1259ca6ce4

    hw/vhost-user-scsi|blk: set `supports_config` flag correctly


-- 
MST


