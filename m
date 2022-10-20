Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F76A606465
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 17:26:31 +0200 (CEST)
Received: from localhost ([::1]:43796 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXRE-0007Rs-KX
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:26:28 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXNe-0005zl-EE
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olVYs-0003I1-1h
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 09:26:15 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:36620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olVYp-0001aC-Va
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 09:26:13 -0400
Received: by mail-wr1-x432.google.com with SMTP id j7so34455110wrr.3
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 06:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ao80pQoZgJGEAb2bodmw5nlbxR+ZMAoIRtnrKk8Ulvg=;
 b=GG8LBf5MqqJv6YT+kENrU5dCgna6fE5XzYqlSlUpJjCNv3JZ7KVoPU0b7Vu/sKur9B
 ZFC9OdOkxuZxC/VZrWzrYf+0gzjWbvyagtaKYv9TIz64LwEQr8fexboSzjT0ZKGAhxAW
 1cADUL0nguDmWMFRPM1VzovKJSMlnNxc/HCP/69yhNTxb6AS2lzIt3Ntml+rQvwWyQ6X
 WiGiHyikIi52GofnS8eD5b1PIi4DH9KRbbTm6gBJScS36SPBREqKzSH/nwMMXwDJb+CV
 WHfuqdVQ0OdhM+96pbDXiuVjF7Pa2QtbtXkQmZsqe6KavhLhhW04EYltLA9l7Z1mkulf
 iOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ao80pQoZgJGEAb2bodmw5nlbxR+ZMAoIRtnrKk8Ulvg=;
 b=DEStVO0rr8Cr029qtziT0T3/Rwp/uKr3jx4A6PYl5sxpHQJAjNpFz5j1S8ugNSymHF
 c14LC/D6Vx9Vl+XV6aeV/7FlBneZK5uttGRa5+UC+4adUCTw2Tz57kHGP0qnSBJBxhcu
 yBxUwiFPolBFMD0qXwieWbv66OusxA+WQXqvNyb4K/16yv1NPNjkGbH3vgXMqT0V3UcP
 saOD5+MzAy4LN3P0dP5qiqZRto2uqz+H0TbcQdRdYtUREVr7FeE5bkKAWD006h1OhPG0
 WYWsc0PGB9MaEmNVQR/wI5lRyIpJ6stP0bLBKv2j/SYMrmwXv8HyQItdxNMeJXZmJbwc
 cg4w==
X-Gm-Message-State: ACrzQf0OuHg5UEbZQtMMT1X8DvghLOYrIVsEQmTLBhFJjglKcjgumxw7
 f1f9l5GroOIgc+Hi3DeiMk48MQ==
X-Google-Smtp-Source: AMsMyM7Om5c8Ma3OvC6cMGxntd1D1a/PZuVouKbHMbYx2ESKorzb5ib/YpCZS+Edolmhg6R8/n71iQ==
X-Received: by 2002:a5d:5b1f:0:b0:22e:51b0:2837 with SMTP id
 bx31-20020a5d5b1f000000b0022e51b02837mr8764681wrb.132.1666272369772; 
 Thu, 20 Oct 2022 06:26:09 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 p11-20020a05600c358b00b003c21ba7d7d6sm3137473wmq.44.2022.10.20.06.26.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 06:26:09 -0700 (PDT)
Message-ID: <0f964c69-e3c7-b40a-be5e-85ae0471916d@linaro.org>
Date: Thu, 20 Oct 2022 15:26:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v12 16/17] tests/qtest: netdev: test stream and dgram
 backends
Content-Language: en-US
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 xen-devel@lists.xenproject.org, Eric Blake <eblake@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 Jason Wang <jasowang@redhat.com>, Anthony Perard
 <anthony.perard@citrix.com>, Thomas Huth <thuth@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Paul Durrant <paul@xen.org>,
 Stefan Weil <sw@weilnetz.de>, Markus Armbruster <armbru@redhat.com>
References: <20221020091624.48368-1-lvivier@redhat.com>
 <20221020091624.48368-17-lvivier@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221020091624.48368-17-lvivier@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 20/10/22 11:16, Laurent Vivier wrote:
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>   tests/qtest/meson.build     |   1 +
>   tests/qtest/netdev-socket.c | 417 ++++++++++++++++++++++++++++++++++++
>   2 files changed, 418 insertions(+)
>   create mode 100644 tests/qtest/netdev-socket.c

> +int main(int argc, char **argv)
> +{
> +    int ret;
> +
> +    g_test_init(&argc, &argv, NULL);
> +
> +    qtest_add_func("/netdev/stream/inet/ipv4", test_stream_inet_ipv4);
> +    qtest_add_func("/netdev/stream/inet/ipv6", test_stream_inet_ipv6);
> +    qtest_add_func("/netdev/stream/unix", test_stream_unix);
> +    qtest_add_func("/netdev/stream/unix/abstract", test_stream_unix_abstract);
> +    qtest_add_func("/netdev/stream/fd", test_stream_fd);

The stream tests don't work for me (testing on Darwin).

ERROR:../../tests/qtest/netdev-socket.c:99:test_stream_inet_ipv4:assertion 
failed (resp == "st0: index=0,type=stream,\r\n"): 
("st0:index=0,type=stream,connection error\r\n" == "st0: 
index=0,type=stream,\r\n")

> +    qtest_add_func("/netdev/dgram/inet", test_dgram_inet);
> +    qtest_add_func("/netdev/dgram/mcast", test_dgram_mcast);
> +    qtest_add_func("/netdev/dgram/unix", test_dgram_unix);
> +    qtest_add_func("/netdev/dgram/fd", test_dgram_fd);

The dgram ones work.

> +    ret = g_test_run();
> +
> +    return ret;
> +}


