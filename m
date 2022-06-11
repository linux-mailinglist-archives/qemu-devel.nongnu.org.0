Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2AA54708D
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 02:37:34 +0200 (CEST)
Received: from localhost ([::1]:47400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzp88-0004WB-UU
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 20:37:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzp6l-0003ke-Mv
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 20:36:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzp6j-0007JW-CH
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 20:36:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654907764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hGRWGAOow7MPGoTTarc6vJLVM83NozvcMBRqhHSpbv0=;
 b=BDnEXz99DvdbZ0AUHxO8DWPbRYX2DrrJMdL+pdYQIXROAMkDxEJZfmHmAKqjK/h05r0iFn
 L+IlJnCreV1jmWxwXSE/f33hbPzY1JQMRt/XYkd3FKmB9yUB4Wk5fqZ8Eg4L/7KbB1cZKT
 DRhAh0ar2NJVT+iXz0IjHHGjGXX7AL4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-swmZt3w7O4WAy77xoWfnnA-1; Fri, 10 Jun 2022 20:36:03 -0400
X-MC-Unique: swmZt3w7O4WAy77xoWfnnA-1
Received: by mail-ed1-f69.google.com with SMTP id
 i20-20020a50fd14000000b0042dd305d0f7so423041eds.18
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 17:36:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=hGRWGAOow7MPGoTTarc6vJLVM83NozvcMBRqhHSpbv0=;
 b=YpV3n8JsBNoMef/xDf5Zv3bTDFcT+hq2NpU7IajODj1kX0ahfkvYj8624w3s+ClWK4
 he3hFRAA3RsjzKzGZYCmyXlOwjBf901v3yBgMa65nBESdzWlhbVHpUNypLtFLifn/mKO
 9epwODdTlUKi5y3r56Ii2UyJwDT63Ht7SelqgFdzLtADZyXQvvJkzHCwR5wZ78+7Jy3z
 y/SF7ZSMivbCNEm2jh4NmmWs/a0/Wz276H6L4yGBEl0oUY3UYV+US3evlMXjYU9Dct6P
 589h7zXz+qpL4N4EAKBm5Hx52Vrbcpd1nCaEWF19shbmfd4eu3sVOzN+w/q3SZL7Tr1D
 HwJQ==
X-Gm-Message-State: AOAM530sOKSfxZyFQqbAsVAbz2dxBT/ythMNEFW9/58LTPnE1JYNy+83
 /ZgX2D4y1CJ/H+8HkofEgFRwxABvptRrVgQbNt5iKlDJf5fTyzr/A7N5wT5PRE+IyTKTGPVy58w
 XvBRsBQvas9iQPDQ=
X-Received: by 2002:a17:906:4482:b0:70a:19e3:d18a with SMTP id
 y2-20020a170906448200b0070a19e3d18amr40954047ejo.510.1654907761693; 
 Fri, 10 Jun 2022 17:36:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwS2nqO9E3Fvl8psXT+U92/6sjjJRR+AMwHaOvxsxIMf2D0j8gv571ld3mPjK2UfddyNw88pg==
X-Received: by 2002:a17:906:4482:b0:70a:19e3:d18a with SMTP id
 y2-20020a170906448200b0070a19e3d18amr40954036ejo.510.1654907761445; 
 Fri, 10 Jun 2022 17:36:01 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 d7-20020a170906344700b006ff52dfccf3sm251729ejb.211.2022.06.10.17.36.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 17:36:01 -0700 (PDT)
Date: Fri, 10 Jun 2022 20:35:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 zhenwei pi <pizhenwei@bytedance.com>, Gonglei <arei.gonglei@huawei.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PULL 54/54] crypto: Introduce RSA algorithm
Message-ID: <20220610203530-mutt-send-email-mst@kernel.org>
References: <20220610075631.367501-1-mst@redhat.com>
 <20220610075631.367501-55-mst@redhat.com>
 <93d111a8-222e-b46f-2f36-1d1784cf0373@amsat.org>
 <fff6fbb7-b1be-610d-c48d-0498df879ae2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fff6fbb7-b1be-610d-c48d-0498df879ae2@linaro.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Fri, Jun 10, 2022 at 11:05:13AM -0700, Richard Henderson wrote:
> On 6/10/22 08:55, Philippe Mathieu-Daudé wrote:
> > On 10/6/22 09:59, Michael S. Tsirkin wrote:
> > > From: zhenwei pi <pizhenwei@bytedance.com>
> > > +static int cryptodev_builtin_set_rsa_options(
> > > +                    int virtio_padding_algo,
> > > +                    int virtio_hash_algo,
> > > +                    QCryptoAkCipherOptionsRSA *opt,
> > > +                    Error **errp)
> > > +{
> > > +    if (virtio_padding_algo == VIRTIO_CRYPTO_RSA_PKCS1_PADDING) {
> > > +        opt->padding_alg = QCRYPTO_RSA_PADDING_ALG_PKCS1;
> > > +        opt->hash_alg =
> > > +            cryptodev_builtin_get_rsa_hash_algo(virtio_hash_algo, errp);
> > > +        if (opt->hash_alg < 0) {
> > > +            return -1;
> > > +        }
> > > +        return 0;
> > > +    }
> > > +
> > > +    if (virtio_padding_algo == VIRTIO_CRYPTO_RSA_RAW_PADDING) {
> > > +        opt->padding_alg = QCRYPTO_RSA_PADDING_ALG_RAW;
> > > +        return 0;
> > > +    }
> > > +
> > > +    error_setg(errp, "Unsupported rsa padding algo: %d", virtio_padding_algo);
> > > +    return -1;
> > > +}
> > 
> > Build failure:
> > 
> > ../backends/cryptodev-builtin.c:187:27: error: result of comparison of
> > unsigned enum expression < 0 is always false
> > [-Werror,-Wtautological-unsigned-enum-zero-compare]
> >          if (opt->hash_alg < 0) {
> >              ~~~~~~~~~~~~~ ^ ~
> 
> Yep, e.g.
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/2574418442
> 


Dropped now and re-pushed a tag. Can you try pulling that pls?

> r~


