Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4091C55E5F0
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 18:24:14 +0200 (CEST)
Received: from localhost ([::1]:47310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6E0a-0001Cs-PZ
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 12:24:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o6Dyr-0000Ag-Az
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 12:22:25 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:43005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o6Dyp-0007qA-IB
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 12:22:25 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2ef5380669cso122483837b3.9
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 09:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0nIuuAkChZd5FxMBHy7zNb73FAfdNOnstyFWCPR0K58=;
 b=es9tagXBcXypA3OcU7htTKuKakLxi0+nsPZjH9RtIcHmEFARfeEinjdAgr7DYFalPd
 JXWG+WQ6K2gjr1o3W+eLrSkxrK6YL80jL7+bNT53fkBqZ7+s233BpUDHe5im0xxQEqxP
 AesluTeA26zWMXU19otevxErM3Y6ZmxYj3ZXDa3m/u0LClG5uUk6RuJJ9iGSwvONegQ1
 AxY+DMMSMHkVObUtzPL0YJ36SbAcvrH0Czrq8BtdRFuQWMbvObktMD2xYuhnQ1qq71aB
 2dh/OaWEfq3QXlCggzK3bxKQcVaVoYwlU1M8ZR42PN/ny8J3royyQtLYkCBUqgQyz++z
 AJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0nIuuAkChZd5FxMBHy7zNb73FAfdNOnstyFWCPR0K58=;
 b=ofx373NgRW0+d0SBdlmzZV9ESiN9IJCb93u+mj+OTLNr+essSpzG+wg4EyGtowuGOF
 xrE5KKr6bgep1Z7l4JY+arrUN1RXSx8831gkUPcna+Pkm/gPhDYXYnE77h57lg4GR/mX
 3vXzsf6a9RwvR2jnKP5VdPYME02c2Nm/XuS7G8IYkKqSeWozwFe+zGjMIq027aVFD6CE
 16yjfY6cNxD5k3J5DNwQ3viSOhDA3mPJRrUphxzHZw8RxRMajsWBMoIllyFdPMoOPFdF
 TlcBxvnfO7tUJ1F1QAX9PFBJJP3ceqa0CGtKfA5mdpgr5BbQq2Pg8wbHq/J2VaWbt6RX
 Vn3Q==
X-Gm-Message-State: AJIora/tcjNioUn/tpGIMtIFFqS+O6SjYdIvHJtpAXaQetn4QgLsz6Ef
 6ZSTpe5H3M0FSqCSxy75zK3vVfkWQ+u+yOfM2Q1ZPQ==
X-Google-Smtp-Source: AGRyM1vBbP9HlO86FAJZywqKh32LFPJi1PvsoVs4CuXok/rSQ5GxddGioujwA56xkLENWGZaICqV4/AkSlx7O5z0iAg=
X-Received: by 2002:a81:1cc:0:b0:317:a0fa:7a61 with SMTP id
 195-20020a8101cc000000b00317a0fa7a61mr22466505ywb.10.1656433342235; Tue, 28
 Jun 2022 09:22:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190919213924.31852-1-minyard@acm.org>
 <20190919213924.31852-13-minyard@acm.org>
In-Reply-To: <20190919213924.31852-13-minyard@acm.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jun 2022 17:21:44 +0100
Message-ID: <CAFEAcA88GqrqoENf8NHxeNgTjj-jutz8Kspk43L1gp_VJJdh+Q@mail.gmail.com>
Subject: Re: [PATCH 12/15] ipmi: Add an SMBus IPMI interface
To: minyard@acm.org
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>,
 "M : Marcel Apfelbaum" <marcel.apfelbaum@gmail.com>, 
 David Gibson <david@gibson.dropbear.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, 19 Sept 2019 at 22:39, <minyard@acm.org> wrote:
>
> From: Corey Minyard <cminyard@mvista.com>
>
> Signed-off-by: Corey Minyard <cminyard@mvista.com>
> ---

Very old patch, but Coverity has decided it doesn't like something
in this function that's still basically the same in the current codebase
(CID 1487146):

> +static int ipmi_write_data(SMBusDevice *dev, uint8_t *buf, uint8_t len)
> +{
> +    SMBusIPMIDevice *sid = SMBUS_IPMI(dev);
> +    bool send = false;
> +    uint8_t cmd;
> +    int ret = 0;
> +
> +    /* length is guaranteed to be >= 1. */
> +    cmd = *buf++;
> +    len--;
> +
> +    /* Handle read request, which don't have any data in the write part. */
> +    switch (cmd) {
> +    case SSIF_IPMI_RESPONSE:
> +        sid->currblk = 0;
> +        ret = ipmi_load_readbuf(sid);
> +        break;
> +
> +    case SSIF_IPMI_MULTI_PART_RESPONSE_MIDDLE:
> +        sid->currblk++;
> +        ret = ipmi_load_readbuf(sid);
> +        break;
> +
> +    case SSIF_IPMI_MULTI_PART_RETRY:
> +        if (len >= 1) {
> +            sid->currblk = buf[0];
> +            ret = ipmi_load_readbuf(sid);
> +        } else {
> +            ret = -1;
> +        }
> +        break;
> +
> +    default:
> +        break;
> +    }
> +
> +    /* This should be a message write, make the length is there and correct. */
> +    if (len >= 1) {
> +        if (*buf != len - 1 || *buf > MAX_SSIF_IPMI_MSG_CHUNK) {
> +            return -1; /* Bogus message */
> +        }
> +        buf++;
> +        len--;
> +    }

After all of this preamble, len can be zero...

> +
> +    switch (cmd) {
> +    case SSIF_IPMI_REQUEST:
> +        send = true;
> +        /* FALLTHRU */
> +    case SSIF_IPMI_MULTI_PART_REQUEST_START:
> +        if (len < 2) {
> +            return -1; /* Bogus. */
> +        }
> +        memcpy(sid->inmsg, buf, len);
> +        sid->inlen = len;
> +        break;
> +
> +    case SSIF_IPMI_MULTI_PART_REQUEST_END:
> +        send = true;
> +        /* FALLTHRU */
> +    case SSIF_IPMI_MULTI_PART_REQUEST_MIDDLE:
> +        if (!sid->inlen) {
> +            return -1; /* Bogus. */
> +        }
> +        if (sid->inlen + len > MAX_SSIF_IPMI_MSG_SIZE) {
> +            sid->inlen = 0; /* Discard the message. */
> +            return -1; /* Bogus. */
> +        }

...this error checking on the values of the 'middle' request
means that after one 'middle' request we can end up with
sid->inlen == MAX_SSIF_IPMI_MSG_SIZE (ie we filled the
entire sid->inmsg[] array).

But then if we get another 'middle' request with len == 0,
that will pass this error checking because (sid->inlen + len == MSG_SIZE)
and fall through into...

> +        if (len < 32) {
> +            /*
> +             * Special hack, a multi-part middle that is less than 32 bytes
> +             * marks the end of a message.  The specification is fairly
> +             * confusing, so some systems to this, even sending a zero
> +             * length end message to mark the end.
> +             */
> +            send = true;
> +        }
> +        memcpy(sid->inmsg + sid->inlen, buf, len);

...calling memcpy() with argument 1 being a pointer that points
one past the end of the array. Even though len will be 0 and
we won't memcpy() anything, this is (depending on how you choose
to intepret things the C standard doesn't come right out and state
explicitly) undefined behaviour, because memcpy() wants to be passed
valid pointers, even if you ask it to do no work with a zero len.

This isn't going to be a visible bug in practical terms, but it would
make Coverity happy if we either (a) rejected a request with an empty
length or else (b) skipped the memcpy(). I don't know enough about
IPMI to know which is better.

> +        sid->inlen += len;
> +        break;
> +    }
> +
> +    if (send && sid->inlen) {
> +        smbus_ipmi_send_msg(sid);
> +    }
> +
> +    return ret;
> +}

thanks
-- PMM

