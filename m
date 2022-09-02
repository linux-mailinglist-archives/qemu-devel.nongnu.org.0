Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CED5AB655
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 18:13:33 +0200 (CEST)
Received: from localhost ([::1]:44634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU9IR-0005Ol-My
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 12:13:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1oU9Fv-00009t-Vm
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 12:10:56 -0400
Received: from esa5.hc2706-39.iphmx.com ([216.71.137.63]:28573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1oU9Ft-0005lZ-0m
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 12:10:54 -0400
X-IronPort-RemoteIP: 209.85.215.197
X-IronPort-MID: 231656886
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:9kXy1qxifUrBBsOLX1l6t+eLxCrEfRIJ4+MujC+fZmUNrF6WrkVVy
 TYcW2jXO//fNDb1ctklao/g/UhQ6JSBnN41GgM/rC00HyNBpPSeOdnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9z8kvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYctitWia++3k
 YqaT/b3ZRn0gFaYDkpOs/jZ8EI35qyp0N8llgdWic5j7Qe2e0Y9Ucp3yZGZdxPQXoRSF+imc
 OfPpJnRErTxpkpF5nuNy94XQ2VTKlLgFVHmZkl+AsBOtiN/Shkaic7XAha9hXB/0F1ll/gpo
 DlEWAfZpQ0BZ8Ugk8xEO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFP20epFMVAbfrRG3cRlBF5i0
 sEZdws0O0Xra+KemNpXS8Fpj8UnadHkZcYR4yA/iz7eCvkiTNbIRKCiCd1whm9hwJATW6yHO
 oxAOGUHgBfoOnWjPn8eDII4kP2AjGS5fjFFwL6QjfBsujaOklwhjtABNvLsYPmWRulVvHymu
 yWY/FrQAg4/BoWmnG/tHnWEw7WncTnAcJsfEaD9+vN0jVm7wGsVBxsLE1yhrpGEZlWWXtteL
 wkM9XNro/FjqwqkSd7yWxD+q3mB1vIBZ+dt/yQBwFnl4sLpD8yxWzFVJtKdQLTKbPMLeAE=
IronPort-HdrOrdr: A9a23:0xabMqjVrB51dM6Va2+QL0htY3BQXucji2hC6mlwRA09TySh/P
 re+cjztCWE6wr5PUtK8+xoV5PsfZqiz+8S3WB8B9uftWrd2FdATrsN0WKK+VSJJ8SUzI9gPM
 lbHJSXL7bLfDpHZf2Q2njdLz4Yq+P3l5xAjN2utktQcQ==
Received: from mail-pg1-f197.google.com ([209.85.215.197])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Sep 2022 12:07:47 -0400
Received: by mail-pg1-f197.google.com with SMTP id
 k62-20020a638441000000b0042b66a99b6aso1384663pgd.18
 for <qemu-devel@nongnu.org>; Fri, 02 Sep 2022 09:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=vQ62tjY9efg5WXXMlIT10RyP1IRznrB9JEGoA99CsnU=;
 b=cceK301/nRZtvlg2jxgPnML0wguZnaGzaMYsTpc0cggIQmNCwQp6N4z7sGBm3m6I1p
 YpMvXlJSFMQxwjPpvuctIUEsGp3MTjUZsIpOUNP7CEnDgbi0E//j0bfPoaAMZg4OXyN5
 7tC9kpdgQsLUnv2NI2DFQAz8+hyWBp7hpoKTOcH30v00CDHrT4J7hXq4koAyJLPfW6+G
 guo6wRijwRj+Mwb6G0tKgkZKPTaG6HruefM/Wfywe+H+0KFnpKA/J9QRTgSU8b8DEUih
 UslTP/hRHnTF/y5KcwLST3G2upumfhyXn4Ge+iKTojEtWlGZa+2W7CYijVojrgeCkT24
 eICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=vQ62tjY9efg5WXXMlIT10RyP1IRznrB9JEGoA99CsnU=;
 b=ihm6yIVI+FaloTDOq1W1yXLLfjws8JB+4NM8jF3se1nkmiIjxV+F7bCoJAFS42pWit
 Punm4ULOo6C+7HcMLNNN7vAuIrADC3Qe2uOm/cfqtm88F5w0K2+fXQJuU3ASB7H9lXBH
 RwS+vGDeaUohlimpQXyaz6NoSBcRbbgXIskgY57rCZBJn0+V76BNyTlU+QMkGbRxZFws
 jjwuFn9/qBCw0b+AVpFV+m3vL+I7ymk83rNHcwUAKzs9PPU2rJqFVWHiBOFT2XCiJnwj
 oyLSWoR/JgwhBA+Cu+jjBuLxmJf072ZOOWGWoRpayGgTxL+Q0M+Icx2txN4TkfpXDVx1
 JPWQ==
X-Gm-Message-State: ACgBeo2ZSxbhEidSRukuB0j8+yKAoNcKdNT2vYwxxwVTXxaZgLyzWzSg
 U/KJuvzJiOLidDBe4ZXqkxhzYENP7yhARZowk60l9gVIGh+68i1SYmeVkWUlR0d2Jto+tgj3nYB
 rqPChgTLALF3L+gsU8/8NCQEOUBsH3w==
X-Received: by 2002:a17:902:ea04:b0:174:b2e1:8b50 with SMTP id
 s4-20020a170902ea0400b00174b2e18b50mr25263509plg.46.1662134867451; 
 Fri, 02 Sep 2022 09:07:47 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7AdMUKb83m27whaMkT11s4KfAXSMZGcksYMYAzraysu8UKfjDudSDLBDzf/mAXOj8mrQ+FNw==
X-Received: by 2002:a17:902:ea04:b0:174:b2e1:8b50 with SMTP id
 s4-20020a170902ea0400b00174b2e18b50mr25263485plg.46.1662134867130; 
 Fri, 02 Sep 2022 09:07:47 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a625e07000000b005381d037d07sm1980755pfb.217.2022.09.02.09.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Sep 2022 09:07:46 -0700 (PDT)
Date: Fri, 2 Sep 2022 12:07:40 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Mauro Matteo Cascella <mcascell@redhat.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, bmeng.cn@gmail.com
Subject: Re: [PATCH] qtest/fuzz-lsi53c895a-test: set guest RAM to 2G
Message-ID: <20220902160740.tfcy3xyi7u6rg5jx@mozz.bu.edu>
References: <20220902133853.834065-1-mcascell@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220902133853.834065-1-mcascell@redhat.com>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.63; envelope-from=alxndr@bu.edu;
 helo=esa5.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 220902 1538, Mauro Matteo Cascella wrote:
> test_lsi_do_msgout_cancel_req does not run on machines with small size
> memory. Reduce guest memory from 4G to 2G to alleviate the problem.
> 
> Reported-by: Bin Meng <bmeng.cn@gmail.com>
> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> ---
>  tests/qtest/fuzz-lsi53c895a-test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Alexander Bulekov <alxndr@bu.edu>

Thanks!

