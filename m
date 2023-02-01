Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D1F6865D3
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 13:20:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNC5A-0001SL-M1; Wed, 01 Feb 2023 07:19:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNC52-0001Qv-Ba
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 07:19:12 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNC4z-0003nK-OJ
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 07:19:12 -0500
Received: by mail-wr1-x42e.google.com with SMTP id h12so17108555wrv.10
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 04:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HBgLIjjxdcsJnOkh/QCN8xypiqKr+AXKYO2nqfxA++Q=;
 b=qqxIINQ+mV0/Q2oC+LYIq8taV7BeZdJgJwt9+j5a4IBbjWqpeGYGt/hv0IyMVyJuo7
 h7eT0/cGd9RmS24tvzbzysy3cJo+Sr/Xtrhx4bhCRtQNcWA7X7kZiw27bvMaIf2an8GN
 qW0XdTRJxqjvFSqXEqA88MEb3FikpQGRfyzWYge4NKePHnHtqxLBFLWVpGDTiRT8+z7x
 hybOth44XKFu8b4gK6CfwZv9SN1P/cpha9cqywyz+2sAlZGTf/adC4GYyGvnYzEFwHfz
 aq7HJ4u1oey6UDkf1zKUMbzx7BoK6PHbNMARljY/oWyn1tp3+bLlwUvm3jrkvSEmf67U
 la4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HBgLIjjxdcsJnOkh/QCN8xypiqKr+AXKYO2nqfxA++Q=;
 b=hn6MI7n2TToLSbgAAlaLAt0lbCmBpKlhqgo7aYVV92JUVvWBy7RsMExHIMZ1NvFh5h
 M4iTgpWvdbOjWRYF0NRf6rdClXEj2SOz9SPCvS89K9uj9F7cPj9eC3xA+sda25XG9QCs
 tzSWezs7FCU2ut4Wip+oFWt4vPgMoF0+eQFf2v5PQHX+1LyKd/E2HjY4WGhBnZcC7t/Q
 TmYrLl3KlnO9NkRQEIWu3PcdfS60s9Ai+IBXbvV4TZTda11qcz78UBDX2eddkLE9ulEa
 PePq171pLEhNkMbO0YPatl+Df2Nly+HdnSRQhQkQbdP9/ICALjo6+IIezRhOWzQVyUym
 toUQ==
X-Gm-Message-State: AO0yUKXW0/azMzu12m6qpBgWYj+jGi5HLC6/y4qoNNEfSZTspg/qQGe0
 K8Inb4a4ExtC301/iAVdkiA4Hw==
X-Google-Smtp-Source: AK7set8VbT/b37MPcXb/FjLd8Zc8Ck0Ujl9acyQffPKXpLGVX97s49bEA7S5PRjWQ2hBWbUZnrcATg==
X-Received: by 2002:a5d:5643:0:b0:2c2:cd4c:235c with SMTP id
 j3-20020a5d5643000000b002c2cd4c235cmr1995496wrw.14.1675253946633; 
 Wed, 01 Feb 2023 04:19:06 -0800 (PST)
Received: from [192.168.242.175] (107.red-88-29-181.dynamicip.rima-tde.net.
 [88.29.181.107]) by smtp.gmail.com with ESMTPSA id
 m2-20020a056000180200b002bfb5618ee7sm17226661wrh.91.2023.02.01.04.19.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 04:19:06 -0800 (PST)
Message-ID: <f464b880-f190-9605-17d3-a023fba0aa63@linaro.org>
Date: Wed, 1 Feb 2023 13:19:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 1/9] Updated the FSF address in file hw/sh4/sh7750_regs.h
Content-Language: en-US
To: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>, qemu-devel@nongnu.org
Cc: ysato@users.sourceforge.jp, alex.bennee@linaro.org, pbonzini@redhat.com,
 fam@euphon.net, peter.maydell@linaro.org, kwolf@redhat.com, hreitz@redhat.com
References: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <bd7883e4dbedd5119c52a37f00a23a5dcef52610.1675234580.git.kkamran.bese16seecs@seecs.edu.pk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/2/23 08:39, Khadija Kamran wrote:

[*]

> Signed-off-by: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
> ---
> The Free Software Foundation moved to a new address and this file referred to their old location.
> The address should be updated and replaced to a pointer to <https://www.gnu.org/licenses/>
> This will resolve the issue #379 in the QEMU source repository

Shouldn't this description go in '[*]' to get recorded in the history?

>   hw/sh4/sh7750_regs.h | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/hw/sh4/sh7750_regs.h b/hw/sh4/sh7750_regs.h
> index beb571d5e9..94043431e6 100644
> --- a/hw/sh4/sh7750_regs.h
> +++ b/hw/sh4/sh7750_regs.h
> @@ -22,8 +22,7 @@
>    * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
>    * General Public License for more details. You should have received
>    * a copy of the GNU General Public License along with RTEMS; see
> - * file COPYING. If not, write to the Free Software Foundation, 675
> - * Mass Ave, Cambridge, MA 02139, USA.
> + * file COPYING. If not, see <https://www.gnu.org/licenses/>.
>    *
>    * As a special exception, including RTEMS header files in a file,
>    * instantiating RTEMS generics or templates, or linking other files


